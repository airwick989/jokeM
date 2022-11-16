import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
              width: 300,
              height: 300,
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Powered by Flutter',
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    )
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                const FlutterLogo(
                  size: 30,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  'and Firebase',
                  style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      )
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Image.asset(
                  'images/firebaseLogo.png',
                  width: 30,
                  height: 30,
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Created by Group 23',
                  style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      )
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}