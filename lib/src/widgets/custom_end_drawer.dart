import 'package:flutter/material.dart';

class CustomEndDrawer extends StatelessWidget {
  const CustomEndDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.credit_card),
            title: const Text('카드 관리'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/cards/register');
            },
          ),
          ListTile(
            leading: const Icon(Icons.monetization_on),
            title: const Text('마일리지 조회'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/mileage');
            },
          ),
        ],
      ),
    );
  }
}
