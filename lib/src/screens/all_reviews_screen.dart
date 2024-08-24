import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../services/auth_service.dart';

class AllReviewsScreen extends StatefulWidget {
  final AuthService authService;

  const AllReviewsScreen({super.key, required this.authService});

  @override
  _AllReviewsScreenState createState() => _AllReviewsScreenState();
}

class _AllReviewsScreenState extends State<AllReviewsScreen> {
  late Future<List<Review>> _reviews;

  @override
  void initState() {
    super.initState();
    _reviews = fetchAllReviews();
  }

  Future<List<Review>> fetchAllReviews() async {
    final token = await widget.authService.storage.read(key: 'jwt');

    if (token == null) {
      throw Exception('토큰이 없습니다. 로그인이 필요합니다.');
    }

    final response = await http.get(
      Uri.parse('http://localhost:8000/all-reviews/'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Review.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load all reviews');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('모든 리뷰'),
      ),
      body: FutureBuilder<List<Review>>(
        future: _reviews,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('에러 발생: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('작성된 리뷰가 없습니다.'));
          } else {
            final reviews = snapshot.data!;
            return ListView.builder(
              itemCount: reviews.length,
              itemBuilder: (context, index) {
                final review = reviews[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: ListTile(
                    title: Text(review.title),
                    subtitle: Text(review.content),
                    trailing: Text(review.date),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

class Review {
  final String title;
  final String content;
  final String date;

  Review({
    required this.title,
    required this.content,
    required this.date,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      title: json['title'],
      content: json['content'],
      date: json['date'],
    );
  }
}

