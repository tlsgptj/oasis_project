import 'dart:async';

import 'package:flutter/material.dart';

import 'home_screen.dart';

class LoadingScreens extends StatefulWidget {
  @override
  LoadingScreenState createState() => LoadingScreenState();
}

class LoadingScreenState extends State<LoadingScreens>{
  double progress = 0.0;
  late Timer _timer;
  @override
  void initState() {
    super.initState();
    _startLoading();
  }

  void _startLoading() {
    // 100ms마다 프로그레스 업데이트
    _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {
        progress += 0.1; // 프로그레스 증가
        if (progress >= 1.0) {
          progress = 1.0; // 최대값 제한
          _timer.cancel(); // 타이머 정지
          _navigateToMainPage(); // 메인 페이지로 이동
        }
      });
    });
  }

  void _navigateToMainPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  @override
  void dispose() {
    _timer.cancel(); // 타이머 해제
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('lib/src/assets/Logo.png',
          width: 150,
          height: 150,),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: LinearProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue[600]!),
              backgroundColor: Colors.grey.shade200,
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

