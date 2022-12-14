import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:joke_m/display_saved_jokes.dart';
import 'package:joke_m/preferences_database.dart';
import 'package:joke_m/shared_preferences.dart';
import 'intro.dart' as intro;
import 'mycolors.dart' as mycolors;
import 'menu.dart' as menu;

Color primaryColor = mycolors.CustomColors.primaryColor;
Color secondaryColor = mycolors.CustomColors.secondaryColor;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Navigation Basics',
    home: MyApp(),
  ));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            Image.asset(
              'images/logo.png',
              width: 400,
              height: 400,
            ),
            const SizedBox(
              height: 20,
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
                      fontSize: 15,
                    )
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                const FlutterLogo(
                  size: 25,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  'and SQLite',
                  style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      )
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Image.asset(
                  'images/sqliteLogo.png',
                  width: 60,
                  height: 60,
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
                        fontSize: 15,
                      )
                  ),
                ),
              ],
            ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Container(
                  margin: const EdgeInsets.all(5),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      final Preferences preferences = await PrefsDatabase.instance.readPreferences(1);
                      if(preferences.skip == 0){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const intro.ScrollableIntro()),
                        );
                      } else{
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const menu.Menu()),
                        );
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(primaryColor),
                    ),
                    child: const Text('Get Started!',
                      style: TextStyle(
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(1.0, 1.0),
                            blurRadius: 3.0,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                          Shadow(
                            offset: Offset(1.0, 1.0),
                            blurRadius: 8.0,
                            color: Color.fromARGB(125, 0, 0, 255),
                          ),
                        ],
                      ),
                    )
                  ),
                ),
              ),
            ),
          ],
        ),
      );
  }
}