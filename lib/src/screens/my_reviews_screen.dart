import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyReviewsScreen extends StatefulWidget {
  const MyReviewsScreen({super.key});

  @override
  _MyReviewsScreenState createState() => _MyReviewsScreenState();
}

class _MyReviewsScreenState extends State<MyReviewsScreen> {
  late Future<List<Review>> _reviews;

  @override
  void initState() {
    super.initState();
    _reviews = fetchReviews();
  }

  Future<List<Review>> fetchReviews() async {
    final response = await http.get(Uri.parse('http://localhost:8000/list/'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Review.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load reviews');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('내 리뷰'),
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
