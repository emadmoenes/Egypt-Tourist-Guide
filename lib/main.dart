import 'package:egypt_tourist_guide/views/auth/login_screen.dart';
import 'package:egypt_tourist_guide/views/auth/signup_screen.dart';
import 'package:egypt_tourist_guide/views/home/home_screen.dart';
import 'package:egypt_tourist_guide/views/profile/profile_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Egypt Tourist Guide',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/signup',
      routes: {
        '/signup': (context) => SignupScreen(),
        '/login': (context) => LoginScreen(),
        '/home': (context) => MyWidget(),
        '/profile': (context) => ProfileScreen(),
      },
    );
  }
}
