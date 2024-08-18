import 'package:flutter/material.dart';
import 'src/screens/login_screen.dart';
import 'src/screens/signup_screen.dart';
import 'src/screens/home_screen.dart';
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
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/home': (context) => const HomeScreen(),
        '/register': (context) => const CardRegisterScreen(),
        '/transactions': (context) => const TransactionListScreen(),
        '/mileage': (context) => const MileageScreen(),
      },
    );
  }
}
