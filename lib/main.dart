// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'pages/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Welcome(),
      theme: ThemeData(
        backgroundColor: Colors.grey[300],
        primaryColor: Colors.black,
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.black),
          bodyText2: TextStyle(color: Colors.black),
          // You can add more text styles as needed
        ),
      ),
    );
  }
}
