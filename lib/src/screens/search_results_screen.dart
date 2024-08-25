import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'place_detail_screen.dart';

class SearchResultsScreen extends StatelessWidget {
  final String query;

  const SearchResultsScreen({required this.query, Key? key}) : super(key: key);

  Future<List<dynamic>> _searchPlace(String query) async {
    final apiKey = '8cf7a1ef1d3dab95f8c2ee323076c1d9';
    final url =
        'https://dapi.kakao.com/v2/local/search/keyword.json?query=$query';

    final response = await http
        .get(Uri.parse(url), headers: {"Authorization": "KakaoAK $apiKey"});

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['documents'];
    } else {
      throw Exception('Failed to load places');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Results'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _searchPlace(query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No results found'));
          } else {
            final places = snapshot.data!;
            return ListView.builder(
              itemCount: places.length,
              itemBuilder: (context, index) {
                final place = places[index];
                return ListTile(
                  title: Text(place['place_name']),
                  subtitle: Text(place['address_name']),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PlaceDetailScreen(place: place),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
