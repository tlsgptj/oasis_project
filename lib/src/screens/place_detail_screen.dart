import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart'; // url_launcher 패키지 추가

import 'search_results_screen.dart';

class PlaceDetailScreen extends StatefulWidget {
  final Store store;

  const PlaceDetailScreen({super.key, required this.store});

  @override
  _PlaceDetailScreenState createState() => _PlaceDetailScreenState();
}

class _PlaceDetailScreenState extends State<PlaceDetailScreen> {
  late Future<String> _placeUrl;

  @override
  void initState() {
    super.initState();
    _placeUrl = fetchPlaceUrl(widget.store);
  }

  Future<String> fetchPlaceUrl(Store store) async {
    const apiKey = '8cf7a1ef1d3dab95f8c2ee323076c1d9'; // 카카오 REST API 키
    final response = await http.get(
        Uri.parse(
            'https://dapi.kakao.com/v2/local/search/keyword.json?query=${Uri.encodeComponent(store.name)}&x=${store.longitude}&y=${store.latitude}'),
        headers: {'Authorization': 'KakaoAK $apiKey'});

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['documents'].isNotEmpty) {
        return data['documents'][0]['place_url']; // 첫 번째 결과의 place_url 반환
      } else {
        throw Exception('No place found for this store');
      }
    } else {
      throw Exception('Failed to load place URL');
    }
  }

  Future<void> _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.store.name),
      ),
      body: FutureBuilder<String>(
        future: _placeUrl,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No place URL found'));
          } else {
            final placeUrl = snapshot.data!;
            return Center(
              child: ElevatedButton(
                onPressed: () => _launchUrl(placeUrl),
                child: const Text('Open Place in Browser'),
              ),
            );
          }
        },
      ),
    );
  }
}
