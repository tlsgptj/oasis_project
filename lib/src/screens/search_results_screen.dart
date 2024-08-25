import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchResultsScreen extends StatefulWidget {
  final String query;
  const SearchResultsScreen({super.key, required this.query});

  @override
  SearchResultsScreenState createState() => SearchResultsScreenState();
}

class SearchResultsScreenState extends State<SearchResultsScreen> {
  late Future<List<Store>> _searchResults;

  @override
  void initState() {
    super.initState();
    _searchResults = fetchStores(widget.query);
  }

  // 한국조폐공사 API를 호출하여 가맹점 목록을 가져오는 함수
  Future<List<Store>> fetchStores(String query) async {
    const apiKey = 'YOUR_API_KEY'; // API 키를 const로 변경
    final response = await http.get(Uri.parse(
        'http://apis.data.go.kr/B190001/localFranchisesV2?serviceKey=$apiKey&type=json&keyword=$query'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data['response']['body']['items'] as List)
          .map((item) => Store.fromJson(item))
          .toList();
    } else {
      throw Exception('Failed to load stores');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Results: ${widget.query}'),
      ),
      body: FutureBuilder<List<Store>>(
        future: _searchResults,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No results found'));
          } else {
            final stores = snapshot.data!;
            return ListView.builder(
              itemCount: stores.length,
              itemBuilder: (context, index) {
                final store = stores[index];
                return ListTile(
                  title: Text(
                    store.name,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        store.category,
                        style:
                            const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      Text(
                        store.address,
                        style: const TextStyle(fontSize: 12),
                      ),
                      Text(
                        store.phone,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  onTap: () {
                    // 가게 상세 정보 화면으로 이동하지 않고, 단순히 가게 목록을 보여줍니다.
                    // 추후 필요시 기능 추가 가능
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

class Store {
  final String name;
  final String address;
  final String phone;
  final String category;

  const Store({
    required this.name,
    required this.address,
    required this.phone,
    required this.category,
  });

  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
      name: json['name'],
      address: json['address'],
      phone: json['phone'] ?? 'N/A',
      category: json['category'] ?? 'N/A',
    );
  }
}
