import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'search_results_screen.dart';

import '../widgets/custom_navigation_bar.dart';

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
      _controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..loadFlutterAsset('assets/kakao_map.html');
    }
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
              icon: const Icon(Icons.search),
              onPressed: _searchPlace,
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
}
