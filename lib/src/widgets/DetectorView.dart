import 'package:camera/camera.dart';
import 'package:camera_process/camera_process.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_commons/google_mlkit_commons.dart' as mlkit;
import 'package:camera_process/camera_process.dart' as camera_process;

class DetectorView extends StatefulWidget {
  final String title;
  final CustomPaint? customPaint;
  final String? text;
  final Function(mlkit.InputImage inputImage) onImage;
  final CameraLensDirection initialCameraLensDirection;
  final Function(CameraLensDirection direction)? onCameraLensDirectionChanged;

  DetectorView({
    required this.title,
    this.customPaint,
    this.text,
    required this.onImage,
    this.initialCameraLensDirection = CameraLensDirection.back,
    this.onCameraLensDirectionChanged,
  });

  @override
  _DetectorViewState createState() => _DetectorViewState();
}

class _DetectorViewState extends State<DetectorView> {
  late CameraController _cameraController;
  late CameraLensDirection _cameraLensDirection;
  late List<CameraDescription> _cameras;

  get format => mlkit.InputImageFormat.nv21;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    _cameras = await availableCameras();
    _cameraLensDirection = widget.initialCameraLensDirection;
    CameraDescription cameraDescription =
    _cameras.firstWhere((camera) => camera.lensDirection == _cameraLensDirection);

    _cameraController = CameraController(cameraDescription, ResolutionPreset.high);
    await _cameraController.initialize();
    _cameraController.startImageStream(_processCameraImage);

    if (widget.onCameraLensDirectionChanged != null) {
      widget.onCameraLensDirectionChanged!(_cameraLensDirection);
    }

    setState(() {});
  }

  void _processCameraImage(CameraImage image) {
    final inputImage = _getInputImageFromCameraImage(image);
    widget.onImage(inputImage);
  }

  mlkit.InputImage _getInputImageFromCameraImage(CameraImage image) {
    final inputImageData = mlkit.InputImageMetadata(
      size: Size(image.width.toDouble(), image.height.toDouble()),
      rotation: mlkit.InputImageRotation.rotation0deg, // 필요에 따라 변경
      format: format,
      bytesPerRow: image.planes[0].bytesPerRow,
    );

    return mlkit.InputImage.fromBytes(
      bytes: image.planes[0].bytes,
      metadata: inputImageData,
    );
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_cameraController.value.isInitialized) {
      return Container(
        color: Colors.black,
        child: const Center(child: CircularProgressIndicator()),
      );
    }

    return Stack(
      children: [
        CameraPreview(_cameraController),
        if (widget.customPaint != null) widget.customPaint!,
        if (widget.text != null)
          Positioned(
            bottom: 16,
            left: 16,
            child: Text(
              widget.text!,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
              ),
            ),
          ),
      ],
    );
  }
}
