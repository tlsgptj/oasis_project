import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../widgets/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  RegisterScreenState createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final AuthService _authService = AuthService();

  void _register() async {
    String nickname = _nicknameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    String confirmPassword = _confirmPasswordController.text;

    if (nickname.isNotEmpty &&
        email.isNotEmpty &&
        password.isNotEmpty &&
        confirmPassword.isNotEmpty) {
      if (password == confirmPassword) {
        bool success = await _authService.register(nickname, email, password);
        if (!mounted) return;
        if (success) {
          Navigator.pushNamed(context, '/login');
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('회원가입 실패')),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('비밀번호가 일치하지 않습니다')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('모든 필드를 입력하세요')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('회원가입'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            CustomTextField(
              controller: _nicknameController,
              labelText: '닉네임',
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _emailController,
              labelText: '이메일',
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _passwordController,
              labelText: '비밀번호',
              obscureText: true,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _confirmPasswordController,
              labelText: '비밀번호 확인',
              obscureText: true,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _register,
              child: const Text('회원가입 완료'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: const Text('로그인'),
            ),
          ],
        ),
      ),
    );
  }
}
