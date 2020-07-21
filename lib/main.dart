import 'package:fancyapp/screens/landing_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Fancy App',
      debugShowCheckedModeBanner: false,
      home: LandingScreen(),
    );
  }
}