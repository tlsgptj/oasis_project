import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/gifticon_model.dart';

class ApiService {
  final String baseUrl = "http://your_django_backend_url/api";

  Future<List<Gifticon>> fetchGifticons() async {
    final response = await http.get(Uri.parse('$baseUrl/gifticons/'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Gifticon.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load gifticons');
    }
  }
}
