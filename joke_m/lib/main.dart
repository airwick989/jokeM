import 'package:flutter/material.dart';

Color secondaryColor = Colors.indigoAccent;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        backgroundColor: secondaryColor,
        body: ListView(
          children: [
            const SizedBox(
              height: 100,
            ),
            Image.asset(
              'images/logo.png',
              width: 150,
              height: 150,
            ),
          ],
        ),
      ),
    );
  }
}