import 'package:flutter/material.dart';
import 'src/screens/login_screen.dart';
import 'src/screens/register_screen.dart';
import 'src/screens/home_screen.dart';
import 'src/screens/map_screen.dart';
import 'src/screens/my_reviews_screen.dart';
import 'src/screens/card_register_screen.dart';
import 'src/screens/transaction_list_screen.dart';
import 'src/screens/mileage_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/members/login',
      routes: {
        '/members/login': (context) => const LoginScreen(),
        '/members/register': (context) => const RegisterScreen(),
        '/home': (context) => const HomeScreen(),
        '/map': (context) => const MapScreen(),
        '/my_reviews': (context) => const MyReviewsScreen(),
        '/cards/register': (context) => const CardRegisterScreen(),
        '/transactions': (context) => const TransactionListScreen(),
        '/mileage': (context) => const MileageScreen(),
      },
    );
  }
}
