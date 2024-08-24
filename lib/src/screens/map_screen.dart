import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../widgets/custom_navigation_bar.dart';
import '../widgets/custom_end_drawer.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  WebViewController? _controller;

  @override
  void initState() {
    super.initState();
    if (!kIsWeb) {
      // Android 또는 iOS에서 WebView 초기화
      _controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..loadFlutterAsset('assets/kakao_map.html');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: const CustomEndDrawer(),
      body: kIsWeb
          ? const Center(
              child: Text('WebView is not supported on web'),
            )
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
