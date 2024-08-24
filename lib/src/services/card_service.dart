import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'http://your-django-server.com'; // Django 서버의 기본 URL

  Future<bool> registerCard(String userId, String cardNumber, String expiryDate, String cvc) async {
    final url = Uri.parse('$baseUrl/api/register-card/'); // Django 서버의 카드 등록 API 엔드포인트
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'user_id': userId,
        'card_number': cardNumber,
        'expiry_date': expiryDate,
        'cvc': cvc,
      }),
    );

    if (response.statusCode == 201) {
      // 성공적으로 카드가 등록됨
      return true;
    } else {
      // 등록 실패
      print('Failed to register card: ${response.body}');
      return false;
    }
  }
}