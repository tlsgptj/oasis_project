import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:camera/camera.dart';

import '../widgets/DetectorView.dart';
import '../widgets/TextRecognizerPainter.dart';

class CardRecognizerScreen extends StatefulWidget {
  @override
  State<CardRecognizerScreen> createState() => _CardRecognizerViewState();
}

class _CardRecognizerViewState extends State<CardRecognizerScreen> {
  var _script = TextRecognitionScript.latin;
  var _textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
  bool _canProcess = true;
  bool _isBusy = false;
  CustomPaint? _customPaint;
  String? _recognizedText;
  var _cameraLensDirection = CameraLensDirection.back;

  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvcController = TextEditingController();

  @override
  void dispose() {
    _canProcess = false;
    _textRecognizer.close();
    _cardNumberController.dispose();
    _expiryDateController.dispose();
    _cvcController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('카드 인식 및 등록')),
      body: Stack(children: [
        // DetectorView는 별도로 정의해야 합니다.
        DetectorView(
          title: '카드 인식',
          customPaint: _customPaint,
          text: _recognizedText,
          onImage: _processImage,
          initialCameraLensDirection: _cameraLensDirection,
          onCameraLensDirectionChanged: (value) => _cameraLensDirection = value,
        ),
        Positioned(
          top: 30,
          left: 100,
          right: 100,
          child: Row(
            children: [
              Spacer(),
              Container(
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: _buildDropdown(),
                  )),
              Spacer(),
            ],
          ),
        ),
        Positioned(
          bottom: 30,
          left: 16,
          right: 16,
          child: Column(
            children: [
              TextField(
                controller: _cardNumberController,
                decoration: const InputDecoration(
                  labelText: '카드 번호',
                  filled: true,
                  fillColor: Colors.white70,
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10),
              TextField(
                controller: _expiryDateController,
                decoration: const InputDecoration(
                  labelText: '유효기간 (MM/YY)',
                  filled: true,
                  fillColor: Colors.white70,
                ),
                keyboardType: TextInputType.datetime,
              ),
              SizedBox(height: 10),
              TextField(
                controller: _cvcController,
                decoration: const InputDecoration(
                  labelText: 'CVC',
                  filled: true,
                  fillColor: Colors.white70,
                ),
                obscureText: true,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _registerCard,
                child: const Text('카드 등록'),
              ),
              if (_recognizedText == null)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '카드를 인식하지 못했습니다. 정보를 직접 입력하세요.',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
            ],
          ),
        ),
      ]),
    );
  }

  Widget _buildDropdown() => DropdownButton<TextRecognitionScript>(
    value: _script,
    icon: const Icon(Icons.arrow_downward),
    elevation: 16,
    style: const TextStyle(color: Colors.blue),
    underline: Container(
      height: 2,
      color: Colors.blue,
    ),
    onChanged: (TextRecognitionScript? script) {
      if (script != null) {
        setState(() {
          _script = script;
          _textRecognizer.close();
          _textRecognizer = TextRecognizer(script: _script);
        });
      }
    },
    items: TextRecognitionScript.values
        .map<DropdownMenuItem<TextRecognitionScript>>((script) {
      return DropdownMenuItem<TextRecognitionScript>(
        value: script,
        child: Text(script.name),
      );
    }).toList(),
  );

  Future<void> _processImage(InputImage inputImage) async {
    if (!_canProcess) return;
    if (_isBusy) return;
    _isBusy = true;
    setState(() {
      _recognizedText = '';
    });
    final recognizedText = await _textRecognizer.processImage(inputImage);
    _updateCardFields(recognizedText.text);

    if (inputImage.metadata?.size != null &&
        inputImage.metadata?.rotation != null) {
      final painter = TextRecognizerPainter(
        recognizedText,
        inputImage.metadata!.size,
        inputImage.metadata!.rotation,
        _cameraLensDirection,
      );
      _customPaint = CustomPaint(painter: painter);
    } else {
      _recognizedText = 'Recognized text:\n\n${recognizedText.text}';
      _customPaint = null;
    }

    if (recognizedText.text.isEmpty) {
      // 인식된 텍스트가 없을 때, 사용자에게 직접 입력을 요청합니다.
      setState(() {
        _recognizedText = null;
      });
    }

    _isBusy = false;
    if (mounted) {
      setState(() {});
    }
  }

  void _updateCardFields(String recognizedText) {
    // 카드 번호 인식
    final cardNumberMatch =
    RegExp(r'\d{4}\s?\d{4}\s?\d{4}\s?\d{4}').firstMatch(recognizedText);
    if (cardNumberMatch != null) {
      _cardNumberController.text = cardNumberMatch.group(0)!.replaceAll(' ', '');
    }

    // 유효기간 인식
    final expiryDateMatch = RegExp(r'\d{2}/\d{2}').firstMatch(recognizedText);
    if (expiryDateMatch != null) {
      _expiryDateController.text = expiryDateMatch.group(0)!;
    }

    // CVC 인식 (필요시 구현)
    // CVC는 일반적으로 인식되지 않으므로, 사용자가 직접 입력하도록 합니다.
  }

  void _registerCard() {
    // 여기서 _cardNumberController.text, _expiryDateController.text, _cvcController.text를 사용하여 카드 등록 로직을 구현
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('카드 등록이 완료되었습니다.')),
    );
  }
}
