import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'dart:convert';

class AuthService {
  final String baseUrl = 'https://yourapi.com/api';
  final storage = const FlutterSecureStorage(); // JWT를 안전하게 저장할 SecureStorage
  final logger = Logger(); // 로거 인스턴스 생성

  // 로그인 메서드
  Future<bool> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/members/login/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      // JWT를 받아서 안전하게 저장
      final Map<String, dynamic> data = jsonDecode(response.body);
      await storage.write(key: 'jwt', value: data['token']);
      return true;
    } else {
      return false;
    }
  }

  // 회원가입 메서드
  Future<bool> signup(String nickname, String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/members/signup/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'nickname': nickname,
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  // JWT를 이용한 인증된 요청 예제
  Future<bool> fetchUserData() async {
    final token = await storage.read(key: 'jwt'); // 저장된 JWT를 가져옴
    if (token == null) {
      throw Exception('JWT 토큰이 존재하지 않습니다.');
    }

    final response = await http.get(
      Uri.parse('$baseUrl/members/user/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token', // 요청 헤더에 JWT를 포함
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      await storage.write(key: 'jwt', value: data['token']);
      return true;
    } else {
      logger.e('로그인 실패: ${response.statusCode}');
      return false;
    }
  }

  // 로그아웃 메서드 (JWT 삭제)
  Future<void> logout() async {
    await storage.delete(key: 'jwt'); // JWT를 안전하게 삭제
  }
}
