import 'package:flutter/material.dart';
import 'package:kinishko/screens/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kinishko',
      home: MainScreen(),
    );
  }
}


