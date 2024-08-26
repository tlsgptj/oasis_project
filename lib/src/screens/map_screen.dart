import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:convert';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import '../widgets/custom_navigation_bar.dart';
import 'search_results_screen.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  WebViewController? _controller;
  TextEditingController searchController = TextEditingController();
  stt.SpeechToText _speechToText = stt.SpeechToText();
  bool _isListening = false;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    if (!kIsWeb) {
      _initializeWebView();
      _requestLocationPermission();
    }
  }

  Future<void> _initializeWebView() async {
    final position = await _getCurrentLocation();
    final lat = position.latitude;
    final lng = position.longitude;

    final stores = await fetchStores(''); // 빈 검색어로 모든 가맹점 가져오기
    final markers = jsonEncode(stores);

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(_buildHtmlUrl(lat, lng, markers)));
  }

  Future<Position> _getCurrentLocation() async {
    return await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
      ),
    );
  }

  void _requestLocationPermission() async {
    await Geolocator.requestPermission();
  }

  String _buildHtmlUrl(double lat, double lng, String markers) {
    final encodedMarkers = Uri.encodeComponent(markers);
    return 'file:///android_asset/flutter_assets/assets/kakao_map.html?lat=$lat&lng=$lng&markers=$encodedMarkers';
  }

  void _searchPlace() {
    final query = searchController.text;
    if (query.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SearchResultsScreen(query: query),
        ),
      );
    }
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speechToText.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speechToText.listen(
          onResult: (val) => setState(() {
            _searchQuery = val.recognizedWords;
            searchController.text = _searchQuery;
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speechToText.stop();
      _searchPlace(); // Perform search when voice input is done
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: TextField(
          controller: searchController,
          decoration: InputDecoration(
            hintText: 'Search for a place...',
            suffixIcon: IconButton(
              icon: _isListening ? Icon(Icons.mic) : Icon(Icons.mic_none),
              onPressed: _listen,
            ),
          ),
        ),
      ),
      body: kIsWeb
          ? const Center(child: Text('웹 환경에서 지도는 HTML로 직접 로드됩니다.'))
          : (_controller != null
          ? WebViewWidget(controller: _controller!)
          : const Center(
        child: Text('This platform does not support WebView'),
      )),
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: null,
        scaffoldKey: _scaffoldKey,
        isMapScreen: true,
      ),
    );
  }

  Future<List<Map<String, dynamic>>> fetchStores(String query) async {
    final apiKey = 'your_api_key_here';
    final response = await http.get(Uri.parse(
        'http://apis.data.go.kr/B190001/localFranchisesV2?serviceKey=$apiKey&type=json&keyword=$query'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data['response']['body']['items'] as List)
          .map((item) => {
        'name': item['name'],
        'latitude': double.parse(item['latitude']),
        'longitude': double.parse(item['longitude']),
      })
          .toList();
    } else {
      throw Exception('일치하는 가게가 없습니다.');
    }
  }
}
