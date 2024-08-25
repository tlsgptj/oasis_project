import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:geolocator/geolocator.dart';

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

  @override
  void initState() {
    super.initState();
    if (!kIsWeb) {
      // 초기화 시 웹뷰와 위치 권한 요청 초기화
      _initializeWebView();
      _requestLocationPermission();
    }
  }

  // 웹뷰 초기화 및 사용자 위치 설정
  Future<void> _initializeWebView() async {
    // 사용자 위치 가져오기
    final position = await _getCurrentLocation();
    final lat = position.latitude;
    final lng = position.longitude;

    // 웹뷰 컨트롤러 초기화 및 HTML 파일 로드
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted) // JavaScript 사용 허용
      ..loadRequest(Uri.parse(_buildHtmlUrl(lat, lng))); // HTML 파일 로드
  }

  // 사용자 현재 위치 가져오기
  Future<Position> _getCurrentLocation() async {
    return await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high, // 위치 정확도 설정
      ),
    );
  }

  // 위치 권한 요청
  void _requestLocationPermission() async {
    await Geolocator.requestPermission();
  }

  // HTML 파일의 URL을 생성, 현재 위치 좌표를 전달
  String _buildHtmlUrl(double lat, double lng) {
    return 'file:///android_asset/flutter_assets/lib/src/assets/kakao_map.html?lat=$lat&lng=$lng';
  }

  // 검색 버튼 클릭 시 검색 결과 화면으로 이동
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        // 검색창을 앱바에 배치
        title: TextField(
          controller: searchController,
          decoration: InputDecoration(
            hintText: 'Search for a place...',
            suffixIcon: IconButton(
              icon: const Icon(Icons.search),
              onPressed: _searchPlace, // 검색 버튼 클릭 시 호출
            ),
          ),
        ),
      ),
      body: kIsWeb
          ? const Center(child: Text('웹 환경에서 지도는 HTML로 직접 로드됩니다.'))
          : (_controller != null
              ? WebViewWidget(controller: _controller!) // 웹뷰 위젯 로드
              : const Center(
                  child: Text('This platform does not support WebView'),
                )),
      // 하단 네비게이션 바
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: null,
        scaffoldKey: _scaffoldKey,
        isMapScreen: true,
      ),
    );
  }
}
