import 'package:flutter/material.dart';
import '../services/api_service.dart';

class CardRegisterScreen extends StatefulWidget {
  const CardRegisterScreen({super.key});

  @override
  CardRegisterScreenState createState() => CardRegisterScreenState();
}

class CardRegisterScreenState extends State<CardRegisterScreen> {
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvcController = TextEditingController();
  final ApiService _apiService = ApiService();

  void _registerCard() async {
    String userId = '1'; // 실제로는 로그인한 사용자의 ID를 사용
    String cardNumber = _cardNumberController.text;
    String expiryDate = _expiryDateController.text;
    String cvc = _cvcController.text;

    bool success =
        await _apiService.registerCard(userId, cardNumber, expiryDate, cvc);
    if (!mounted) return; // mounted 체크 추가

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('카드가 성공적으로 등록되었습니다.')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('카드 등록에 실패했습니다.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('카드 등록')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _cardNumberController,
              decoration: const InputDecoration(labelText: '카드 번호'),
            ),
            TextField(
              controller: _expiryDateController,
              decoration: const InputDecoration(labelText: '유효기간 (MM/YY)'),
            ),
            TextField(
              controller: _cvcController,
              decoration: const InputDecoration(labelText: 'CVC'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _registerCard,
              child: const Text('카드 등록'),
            ),
          ],
        ),
      ),
    );
  }
}
