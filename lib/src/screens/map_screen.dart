import 'package:flutter/material.dart';
import '../widgets/custom_navigation_bar.dart';
import '../widgets/custom_end_drawer.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: const CustomEndDrawer(), // 햄버거 메뉴와 연결된 Drawer
      body: const Center(
        child: Text('지도 화면'),
      ),
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: null, // 아무것도 선택되지 않은 상태로 유지
        scaffoldKey: _scaffoldKey,
        isMapScreen: true, // 지도 화면이므로 true
      ),
    );
  }
}
