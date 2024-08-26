import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:convert';
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
  List<Map<String, dynamic>> stores = [];

  @override
  void initState() {
    super.initState();
    stores = _generateMockStores(); // 목데이터 생성
    if (!kIsWeb) {
      _initializeWebView();
      _requestLocationPermission();
    } else {
      _loadHtmlForWeb();
    }
  }

  Future<void> _initializeWebView() async {
    final position = await _getCurrentLocation();
    final lat = position.latitude;
    final lng = position.longitude;

    // Add the current location marker to the stores data
    stores.add({
      'name': '현재 위치',
      'latitude': lat,
      'longitude': lng,
      'isCurrentLocation': true
    });

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(_buildHtmlUrl(lat, lng, jsonEncode(stores))));
  }

  void _loadHtmlForWeb() {
    // Load the HTML content directly or use an iframe to embed a map
    final htmlContent = '''
      <html>
        <head>
          <title>Map</title>
          <script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=YOUR_KAKAO_APP_KEY"></script>
        </head>
        <body>
          <div id="map" style="width:100%;height:100%;"></div>
          <script>
            var container = document.getElementById('map');
            var options = {
              center: new kakao.maps.LatLng(37.5665, 126.9780),
              level: 3
            };
            var map = new kakao.maps.Map(container, options);
          </script>
        </body>
      </html>
    ''';

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.dataFromString(htmlContent, mimeType: 'text/html', encoding: Encoding.getByName('utf-8')));
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
    final query = searchController.text.toLowerCase();
    if (query.isNotEmpty) {
      final filteredStores = stores.where((store) {
        return store['name'].toLowerCase().contains(query);
      }).toList();

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SearchResultsScreen(query: query, stores: filteredStores),
        ),
      );
    }
  }

  List<Map<String, dynamic>> _generateMockStores() {
    return List.generate(30, (index) {
      return {
        'name': '상점 ${index + 1}',
        'latitude': 37.5665 + index * 0.001,
        'longitude': 126.9780 + index * 0.001,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: TextField(
          controller: searchController,
          decoration: const InputDecoration(
            hintText: '장소를 검색중입니다.',
          ),
          onSubmitted: (value) => _searchPlace(),
        ),
      ),
      body: kIsWeb
          ? (_controller != null
          ? WebViewWidget(controller: _controller!)
          : const Center(
        child: Text('지도 로드 실패'),
      ))
          : (_controller != null
          ? WebViewWidget(controller: _controller!)
          : const Center(
        child: Text('웹뷰를 지원하지 않습니다.'),
      )),
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: null,
        scaffoldKey: _scaffoldKey,
        isMapScreen: true,
      ),
    );
  }
}

class SearchResultsScreen extends StatelessWidget {
  final String query;
  final List<Map<String, dynamic>> stores;

  const SearchResultsScreen({required this.query, required this.stores, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('검색 결과: $query'),
      ),
      body: ListView.builder(
        itemCount: stores.length,
        itemBuilder: (context, index) {
          final store = stores[index];
          return ListTile(
            title: Text(store['name']),
            subtitle: Text('위도: ${store['latitude']}, 경도: ${store['longitude']}'),
          );
        },
      ),
    );
  }
}
