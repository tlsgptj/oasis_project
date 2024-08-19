import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // GlobalKey를 생성하여 ScaffoldState를 관리
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  static const List<Widget> _widgetOptions = <Widget>[
    Text('내 리뷰 화면'),
    Text('지도 화면'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // 하단 내비게이션 바에서 햄버거 메뉴를 선택한 경우
    if (index == 2) {
      // GlobalKey를 사용하여 ScaffoldState에 접근하고, 드로어를 엶
      _scaffoldKey.currentState?.openEndDrawer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // GlobalKey를 Scaffold에 연결
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                '메뉴',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('마이 페이지'),
              onTap: () {
                // 사용자 정보 페이지로 이동 (미구현)
              },
            ),
            ListTile(
              leading: const Icon(Icons.credit_card),
              title: const Text('카드 관리'),
              onTap: () {
                Navigator.pushNamed(context, '/cards/register');
              },
            ),
            ListTile(
              leading: const Icon(Icons.monetization_on),
              title: const Text('마일리지 조회'),
              onTap: () {
                Navigator.pushNamed(context, '/mileage');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: _selectedIndex < 2
            ? _widgetOptions.elementAt(_selectedIndex)
            : const Text('메뉴를 선택하세요'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.reviews),
            label: '내 리뷰',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: '지도',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: '메뉴',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
