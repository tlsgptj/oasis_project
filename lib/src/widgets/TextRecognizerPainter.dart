import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:camera/camera.dart';

class TextRecognizerPainter extends CustomPainter {
  TextRecognizerPainter(
      this.recognizedText,
      this.imageSize,
      this.rotation,
      this.cameraLensDirection,
      );

  final RecognizedText recognizedText;
  final Size imageSize;
  final InputImageRotation rotation;
  final CameraLensDirection cameraLensDirection;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0
      ..color = Colors.lightGreenAccent;

    for (final textBlock in recognizedText.blocks) {
      final rect = Rect.fromLTRB(
        translateX(textBlock.boundingBox.left, size, imageSize, rotation, cameraLensDirection),
        translateY(textBlock.boundingBox.top, size, imageSize, rotation, cameraLensDirection),
        translateX(textBlock.boundingBox.right, size, imageSize, rotation, cameraLensDirection),
        translateY(textBlock.boundingBox.bottom, size, imageSize, rotation, cameraLensDirection),
      );

      canvas.drawRect(rect, paint);
    }
  }

  @override
  bool shouldRepaint(TextRecognizerPainter oldDelegate) {
    return oldDelegate.recognizedText != recognizedText;
  }

  double translateX(
      double x, Size size, Size imageSize, InputImageRotation rotation, CameraLensDirection cameraLensDirection) {
    switch (rotation) {
      case InputImageRotation.rotation90deg:
        return x * size.width / imageSize.height;
      case InputImageRotation.rotation270deg:
        return size.width - (x * size.width / imageSize.height);
      case InputImageRotation.rotation180deg:
        return size.width - (x * size.width / imageSize.width);
      default:
        return x * size.width / imageSize.width;
    }
  }

  double translateY(
      double y, Size size, Size imageSize, InputImageRotation rotation, CameraLensDirection cameraLensDirection) {
    switch (rotation) {
      case InputImageRotation.rotation90deg:
      case InputImageRotation.rotation270deg:
        return y * size.height / imageSize.width;
      case InputImageRotation.rotation180deg:
        return size.height - (y * size.height / imageSize.height);
      default:
        return y * size.height / imageSize.height;
    }
  }
}
