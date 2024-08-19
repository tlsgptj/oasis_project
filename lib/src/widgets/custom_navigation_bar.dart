import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  final int? selectedIndex;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final bool isMapScreen;

  const CustomNavigationBar({
    super.key,
    this.selectedIndex,
    required this.scaffoldKey,
    required this.isMapScreen,
  });

  void _onItemTapped(BuildContext context, int index) {
    if (index == 0) {
      Navigator.pushReplacementNamed(context, '/my_reviews');
    } else if (index == 1) {
      if (isMapScreen) {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        Navigator.pushReplacementNamed(context, '/map');
      }
    } else if (index == 2) {
      scaffoldKey.currentState?.openEndDrawer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, -1),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(
            context,
            icon: Icons.reviews,
            label: '내 리뷰',
            index: 0,
          ),
          _buildNavItem(
            context,
            icon: isMapScreen ? Icons.home : Icons.location_on,
            label: isMapScreen ? '홈' : '지도',
            index: 1,
            isCenter: true,
          ),
          _buildNavItem(
            context,
            icon: Icons.menu,
            label: '메뉴',
            index: 2,
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context,
      {required IconData icon,
      required String label,
      required int index,
      bool isCenter = false}) {
    return GestureDetector(
      onTap: () => _onItemTapped(context, index),
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isCenter)
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue.shade700, // 원형 배경 색상
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 32,
                ),
              )
            else
              Icon(
                icon,
                color: selectedIndex == index ? Colors.blue : Colors.grey,
              ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: selectedIndex == index ? Colors.blue : Colors.grey,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
