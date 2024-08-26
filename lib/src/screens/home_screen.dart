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
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: const CustomEndDrawer(), // 햄버거 메뉴와 연결된 Drawer
      body: Container(
        width: 393,
        height: 852,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(color: Colors.white),
        child: Stack(
          children: [
            Positioned(
              left: 266,
              top: 87,
              child: Container(
                width: 69,
                height: 73,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://via.placeholder.com/69x73"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 38,
              top: 90,
              child: Text(
                'Test User님 \n방문을 환영합니다!',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Noto Sans KR',
                  fontWeight: FontWeight.w500,
                  height: 0,
                  letterSpacing: 1.40,
                ),
              ),
            ),
            Positioned(
              left: 29,
              top: 157,
              child: Container(
                width: 335,
                height: 160,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 335,
                      height: 160,
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
                  ],
                ),
              ),
            ),
            Positioned(
              left: 51,
              top: 172,
              child: Text(
                '현재 마일리지',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Noto Sans KR',
                  fontWeight: FontWeight.w500,
                  height: 0,
                  letterSpacing: 1.40,
                ),
              ),
            ),
            Positioned(
              left: 255,
              top: 278,
              child: Container(
                width: 82,
                height: 19,
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
                        fontSize: 15,
                        fontFamily: 'Noto Sans KR',
                        fontWeight: FontWeight.w500,
                        height: 0,
                        letterSpacing: 1.05,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 127,
              top: 223,
              child: Container(
                width: 210,
                height: 34,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(color: Colors.white.withOpacity(0)),
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 33,
                      child: Container(
                        width: 210,
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
                          fontSize: 28,
                          fontFamily: 'Noto Sans KR',
                          fontWeight: FontWeight.w500,
                          height: 0,
                          letterSpacing: 1.96,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 29,
              top: 482,
              child: Container(
                width: 335,
                height: 221,
                child: Stack(
                  children: [
                    Positioned(
                      left: 44,
                      top: 57,
                      child: Text(
                        '1위',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontFamily: 'Noto Sans KR',
                          fontWeight: FontWeight.w500,
                          height: 0,
                          letterSpacing: 1.54,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 153,
                      top: 57,
                      child: Text(
                        '○○ 떡볶이',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontFamily: 'Noto Sans KR',
                          fontWeight: FontWeight.w500,
                          height: 0,
                          letterSpacing: 1.54,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 153,
                      top: 125,
                      child: Text(
                        '△△ 바리스타',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontFamily: 'Noto Sans KR',
                          fontWeight: FontWeight.w500,
                          height: 0,
                          letterSpacing: 1.54,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 153,
                      top: 189,
                      child: Text(
                        '□□ 초밥 ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontFamily: 'Noto Sans KR',
                          fontWeight: FontWeight.w500,
                          height: 0,
                          letterSpacing: 1.54,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 44,
                      top: 123,
                      child: Text(
                        '2위',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontFamily: 'Noto Sans KR',
                          fontWeight: FontWeight.w500,
                          height: 0,
                          letterSpacing: 1.54,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 45,
                      top: 189,
                      child: Text(
                        '3위',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontFamily: 'Noto Sans KR',
                          fontWeight: FontWeight.w500,
                          height: 0,
                          letterSpacing: 1.54,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 3,
                      top: 0,
                      child: Text(
                        '가장 많이 이용한 가게는?',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Noto Sans KR',
                          fontWeight: FontWeight.w500,
                          height: 0,
                          letterSpacing: 1.40,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 38,
                      child: Container(
                        width: 335,
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
                      left: 17,
                      top: 108,
                      child: Container(
                        width: 300,
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
              left: 291,
              top: 706,
              child: Container(
                width: 69,
                height: 22,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 3,
                      child: Container(
                        width: 19,
                        height: 19,
                        decoration: ShapeDecoration(
                          color: Color(0x00D9D9D9),
                          shape: OvalBorder(
                            side: BorderSide(width: 1, color: Color(0xFFFFA40B)),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 25,
                      top: 0,
                      child: Text(
                        '더보기',
                        style: TextStyle(
                          color: Color(0xFFFFA40B),
                          fontSize: 15,
                          fontFamily: 'Noto Sans KR',
                          fontWeight: FontWeight.w500,
                          height: 0,
                          letterSpacing: 1.05,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 30,
              top: 337,
              child: Container(
                width: 334.96,
                height: 130.48,
                child: Stack(
                  children: [
                    Positioned(
                      left: 227.38,
                      top: 0,
                      child: Container(
                        width: 107.59,
                        height: 130.48,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0.33,
                              top: -0.16,
                              child: Container(
                                width: 107.42,
                                height: 126.05,
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
                                width: 68.94,
                                height: 67.75,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: OvalBorder(
                                    side: BorderSide(width: 0.76, color: Color(0xFFF8DDAF)),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 35.07,
                              top: 22.53,
                              child: Container(
                                width: 41.62,
                                height: 44.85,
                                child: Stack(),
                              ),
                            ),
                            Positioned(
                              left: 23.25,
                              top: 87.62,
                              child: SizedBox(
                                width: 65.86,
                                height: 24.07,
                                child: Text(
                                  '선물하기',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.26,
                                    fontFamily: 'Noto Sans KR',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
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
                      left: 112.16,
                      top: 0,
                      child: Container(
                        width: 105.30,
                        height: 125.98,
                        child: Stack(
                          children: [
                            Positioned(
                              left: -0.29,
                              top: -0.10,
                              child: Container(
                                width: 105.77,
                                height: 124.12,
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
                              left: 18.65,
                              top: 13.08,
                              child: Container(
                                width: 67.88,
                                height: 66.71,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: OvalBorder(
                                    side: BorderSide(width: 0.76, color: Color(0xFFF8DDAF)),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 19.44,
                              top: 86.78,
                              child: SizedBox(
                                width: 66.30,
                                height: 22.50,
                                child: Text(
                                  '제휴 쿠폰',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.26,
                                    fontFamily: 'Noto Sans KR',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
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
                      top: 2.25,
                      child: Container(
                        width: 102.24,
                        height: 123.73,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 102.24,
                                height: 122.08,
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
                              left: 18.31,
                              top: 12.97,
                              child: Container(
                                width: 65.62,
                                height: 65.62,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: OvalBorder(
                                    side: BorderSide(width: 0.76, color: Color(0xFFF8DDAF)),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 22.13,
                              top: 86.98,
                              child: Text(
                                '기프티콘',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.26,
                                  fontFamily: 'Noto Sans KR',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
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
              top: 743,
              child: Container(
                width: 393,
                height: 109,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(color: Colors.white.withOpacity(0)),
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 26,
                      child: Container(
                        width: 393,
                        height: 83,
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
                      left: 163,
                      top: 34,
                      child: Container(
                        width: 67,
                        height: 67,
                        decoration: ShapeDecoration(
                          shape: OvalBorder(
                            side: BorderSide(width: 3, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 20,
                      top: 48,
                      child: Container(
                        width: 45,
                        height: 45,
                        child: FlutterLogo(),
                      ),
                    ),
                    Positioned(
                      left: 328,
                      top: 43,
                      child: Container(
                        width: 53,
                        height: 53,
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
              left: 165,
              top: 779,
              child: Container(
                width: 63,
                height: 63,
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
