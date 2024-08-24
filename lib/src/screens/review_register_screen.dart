import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ReviewPage extends StatefulWidget {
  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _reviewController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _reviewController.dispose();
    super.dispose();
  }

  Future<void> _submitReview() async {
    if (_formKey.currentState!.validate()) {
      final response = await http.post(
        Uri.parse('http://localhost:8000/create/'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': _nameController.text,
          'review': _reviewController.text,
        }),
      );

      if (response.statusCode == 201) {
        // 성공 메시지 표시
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('리뷰가 등록되었습니다!')));

        // 폼 초기화
        _nameController.clear();
        _reviewController.clear();
      } else {
        // 에러 메시지 표시
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('리뷰 등록 실패')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('리뷰 등록'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: '제목'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '제목을 입력해주세요';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _reviewController,
                decoration: InputDecoration(labelText: '리뷰'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '리뷰를 입력해주세요';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitReview,
                child: Text('리뷰 제출'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
