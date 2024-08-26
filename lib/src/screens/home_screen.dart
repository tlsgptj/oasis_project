import 'package:flutter/material.dart';
import '../widgets/custom_navigation_bar.dart';
import '../widgets/custom_end_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      key: _scaffoldKey,
      endDrawer: const CustomEndDrawer(), // 햄버거 메뉴와 연결된 Drawer
      body: Container(
        width: screenWidth,
        height: screenHeight,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(color: Colors.white),
        child: Stack(
          children: [
            Positioned(
              left: screenWidth * 0.68,
              top: screenHeight * 0.1,
              child: Container(
                width: screenWidth * 0.18,
                height: screenHeight * 0.085,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://via.placeholder.com/69x73"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Positioned(
              left: screenWidth * 0.1,
              top: screenHeight * 0.11,
              child: Text(
                'Test User님 \n방문을 환영합니다!',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: screenWidth * 0.05,
                  fontFamily: 'Noto Sans KR',
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                  letterSpacing: 1.4,
                ),
              ),
            ),
            Positioned(
              left: screenWidth * 0.075,
              top: screenHeight * 0.2,
              child: Container(
                width: screenWidth * 0.85,
                height: screenHeight * 0.19,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 3, color: Color(0xFFFFA40B)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0xFFF2D4A7),
                      blurRadius: 5,
                      offset: Offset(0, 5),
                      spreadRadius: 0,
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              left: screenWidth * 0.13,
              top: screenHeight * 0.22,
              child: Text(
                '현재 마일리지',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: screenWidth * 0.05,
                  fontFamily: 'Noto Sans KR',
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                  letterSpacing: 1.4,
                ),
              ),
            ),
            Positioned(
              left: screenWidth * 0.65,
              top: screenHeight * 0.33,
              child: Container(
                width: screenWidth * 0.2,
                height: screenHeight * 0.03,
                padding: const EdgeInsets.only(right: 2),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(color: Colors.white.withOpacity(0)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '내역 보기',
                      style: TextStyle(
                        color: Color(0xFFFFA40B),
                        fontSize: screenWidth * 0.04,
                        fontFamily: 'Noto Sans KR',
                        fontWeight: FontWeight.w500,
                        height: 1.5,
                        letterSpacing: 1.05,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: screenWidth * 0.32,
              top: screenHeight * 0.27,
              child: Container(
                width: screenWidth * 0.53,
                height: screenHeight * 0.04,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(color: Colors.white.withOpacity(0)),
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: screenHeight * 0.038,
                      child: Container(
                        width: screenWidth * 0.53,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              strokeAlign: BorderSide.strokeAlignCenter,
                              color: Color(0xFFF0B45A),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: -7,
                      child: Text(
                        '123,456 포인트',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: screenWidth * 0.07,
                          fontFamily: 'Noto Sans KR',
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                          letterSpacing: 1.96,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: screenWidth * 0.075,
              top: screenHeight * 0.57,
              child: Container(
                width: screenWidth * 0.85,
                height: screenHeight * 0.26,
                child: Stack(
                  children: [
                    Positioned(
                      left: screenWidth * 0.11,
                      top: screenHeight * 0.08,
                      child: Text(
                        '1위',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: screenWidth * 0.055,
                          fontFamily: 'Noto Sans KR',
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                          letterSpacing: 1.54,
                        ),
                      ),
                    ),
                    Positioned(
                      left: screenWidth * 0.39,
                      top: screenHeight * 0.08,
                      child: Text(
                        '○○ 떡볶이',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: screenWidth * 0.055,
                          fontFamily: 'Noto Sans KR',
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                          letterSpacing: 1.54,
                        ),
                      ),
                    ),
                    Positioned(
                      left: screenWidth * 0.39,
                      top: screenHeight * 0.17,
                      child: Text(
                        '△△ 바리스타',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: screenWidth * 0.055,
                          fontFamily: 'Noto Sans KR',
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                          letterSpacing: 1.54,
                        ),
                      ),
                    ),
                    Positioned(
                      left: screenWidth * 0.39,
                      top: screenHeight * 0.25,
                      child: Text(
                        '□□ 초밥 ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: screenWidth * 0.055,
                          fontFamily: 'Noto Sans KR',
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                          letterSpacing: 1.54,
                        ),
                      ),
                    ),
                    Positioned(
                      left: screenWidth * 0.11,
                      top: screenHeight * 0.17,
                      child: Text(
                        '2위',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: screenWidth * 0.055,
                          fontFamily: 'Noto Sans KR',
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                          letterSpacing: 1.54,
                        ),
                      ),
                    ),
                    Positioned(
                      left: screenWidth * 0.11,
                      top: screenHeight * 0.25,
                      child: Text(
                        '3위',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: screenWidth * 0.055,
                          fontFamily: 'Noto Sans KR',
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                          letterSpacing: 1.54,
                        ),
                      ),
                    ),
                    Positioned(
                      left: screenWidth * 0.01,
                      top: 0,
                      child: Text(
                        '가장 많이 이용한 가게는?',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: screenWidth * 0.05,
                          fontFamily: 'Noto Sans KR',
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                          letterSpacing: 1.4,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: screenHeight * 0.044,
                      child: Container(
                        width: screenWidth * 0.85,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 2,
                              strokeAlign: BorderSide.strokeAlignCenter,
                              color: Color(0xFFF0B45A),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: screenWidth * 0.045,
                      top: screenHeight * 0.15,
                      child: Container(
                        width: screenWidth * 0.8,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1.50,
                              strokeAlign: BorderSide.strokeAlignCenter,
                              color: Color(0xFFF8DDAF),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: screenWidth * 0.74,
              top: screenHeight * 0.82,
              child: Container(
                width: screenWidth * 0.18,
                height: screenHeight * 0.03,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 3,
                      child: Container(
                        width: screenWidth * 0.05,
                        height: screenHeight * 0.022,
                        decoration: ShapeDecoration(
                          color: Color(0x00D9D9D9),
                          shape: OvalBorder(
                            side: BorderSide(width: 1, color: Color(0xFFFFA40B)),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: screenWidth * 0.07,
                      top: 0,
                      child: Text(
                        '더보기',
                        style: TextStyle(
                          color: Color(0xFFFFA40B),
                          fontSize: screenWidth * 0.04,
                          fontFamily: 'Noto Sans KR',
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                          letterSpacing: 1.05,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: screenWidth * 0.075,
              top: screenHeight * 0.4,
              child: Container(
                width: screenWidth * 0.85,
                height: screenHeight * 0.15,
                child: Stack(
                  children: [
                    Positioned(
                      left: screenWidth * 0.57,
                      top: 0,
                      child: Container(
                        width: screenWidth * 0.27,
                        height: screenHeight * 0.15,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0.33,
                              top: -0.16,
                              child: Container(
                                width: screenWidth * 0.27,
                                height: screenHeight * 0.15,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(width: 1.53, color: Color(0xFFFCBD52)),
                                    borderRadius: BorderRadius.circular(22.89),
                                  ),
                                  shadows: [
                                    BoxShadow(
                                      color: Color(0x3F000000),
                                      blurRadius: 3.05,
                                      offset: Offset(0, 3.05),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 19.57,
                              top: 13.23,
                              child: Container(
                                width: screenWidth * 0.18,
                                height: screenHeight * 0.08,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: OvalBorder(
                                    side: BorderSide(width: 0.76, color: Color(0xFFF8DDAF)),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: screenWidth * 0.09,
                              top: screenHeight * 0.03,
                              child: Container(
                                width: screenWidth * 0.12,
                                height: screenHeight * 0.05,
                                child: Stack(),
                              ),
                            ),
                            Positioned(
                              left: screenWidth * 0.06,
                              top: screenHeight * 0.1,
                              child: SizedBox(
                                width: screenWidth * 0.18,
                                height: screenHeight * 0.035,
                                child: Text(
                                  '선물하기',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: screenWidth * 0.04,
                                    fontFamily: 'Noto Sans KR',
                                    fontWeight: FontWeight.w500,
                                    height: 1.5,
                                    letterSpacing: 1.07,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: screenWidth * 0.285,
                      top: 0,
                      child: Container(
                        width: screenWidth * 0.27,
                        height: screenHeight * 0.15,
                        child: Stack(
                          children: [
                            Positioned(
                              left: -0.29,
                              top: -0.10,
                              child: Container(
                                width: screenWidth * 0.27,
                                height: screenHeight * 0.14,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(width: 1.53, color: Color(0xFFFCBD52)),
                                    borderRadius: BorderRadius.circular(22.89),
                                  ),
                                  shadows: [
                                    BoxShadow(
                                      color: Color(0x3F000000),
                                      blurRadius: 3.05,
                                      offset: Offset(0, 3.05),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: screenWidth * 0.047,
                              top: screenHeight * 0.03,
                              child: Container(
                                width: screenWidth * 0.18,
                                height: screenHeight * 0.08,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: OvalBorder(
                                    side: BorderSide(width: 0.76, color: Color(0xFFF8DDAF)),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: screenWidth * 0.05,
                              top: screenHeight * 0.1,
                              child: SizedBox(
                                width: screenWidth * 0.18,
                                height: screenHeight * 0.035,
                                child: Text(
                                  '제휴 쿠폰',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: screenWidth * 0.04,
                                    fontFamily: 'Noto Sans KR',
                                    fontWeight: FontWeight.w500,
                                    height: 1.5,
                                    letterSpacing: 1.07,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: screenHeight * 0.002,
                      child: Container(
                        width: screenWidth * 0.26,
                        height: screenHeight * 0.14,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: screenWidth * 0.26,
                                height: screenHeight * 0.14,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(width: 1.53, color: Color(0xFFFCBD52)),
                                    borderRadius: BorderRadius.circular(22.89),
                                  ),
                                  shadows: [
                                    BoxShadow(
                                      color: Color(0x3F000000),
                                      blurRadius: 3.05,
                                      offset: Offset(0, 3.05),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: screenWidth * 0.045,
                              top: screenHeight * 0.015,
                              child: Container(
                                width: screenWidth * 0.17,
                                height: screenHeight * 0.08,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: OvalBorder(
                                    side: BorderSide(width: 0.76, color: Color(0xFFF8DDAF)),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: screenWidth * 0.06,
                              top: screenHeight * 0.1,
                              child: Text(
                                '기프티콘',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: screenWidth * 0.04,
                                  fontFamily: 'Noto Sans KR',
                                  fontWeight: FontWeight.w500,
                                  height: 1.5,
                                  letterSpacing: 1.07,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: screenHeight * 0.87,
              child: Container(
                width: screenWidth,
                height: screenHeight * 0.13,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(color: Colors.white.withOpacity(0)),
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: screenHeight * 0.03,
                      child: Container(
                        width: screenWidth,
                        height: screenHeight * 0.1,
                        decoration: ShapeDecoration(
                          color: Color(0xFFF8E6C7),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          shadows: [
                            BoxShadow(
                              color: Color(0x26000000),
                              blurRadius: 20,
                              offset: Offset(0, -10),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: screenWidth * 0.42,
                      top: screenHeight * 0.04,
                      child: Container(
                        width: screenWidth * 0.18,
                        height: screenHeight * 0.08,
                        decoration: ShapeDecoration(
                          shape: OvalBorder(
                            side: BorderSide(width: 3, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: screenWidth * 0.05,
                      top: screenHeight * 0.06,
                      child: Container(
                        width: screenWidth * 0.11,
                        height: screenHeight * 0.06,
                        child: FlutterLogo(),
                      ),
                    ),
                    Positioned(
                      left: screenWidth * 0.84,
                      top: screenHeight * 0.05,
                      child: Container(
                        width: screenWidth * 0.14,
                        height: screenHeight * 0.08,
                        padding: const EdgeInsets.symmetric(horizontal: 4.42, vertical: 11.04),
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: screenWidth * 0.42,
              top: screenHeight * 0.91,
              child: Container(
                width: screenWidth * 0.16,
                height: screenHeight * 0.08,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(),
                child: FlutterLogo(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: null, // 아무것도 선택되지 않은 상태로 유지
        scaffoldKey: _scaffoldKey,
        isMapScreen: false, // 홈 화면이므로 false
      ),
    );
  }
}
