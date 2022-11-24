import 'dart:ui';
import 'package:flutter/material.dart';
import 'mycolors.dart' as mycolors;
import 'package:google_fonts/google_fonts.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';
import 'categories.dart' as categories;
import 'options.dart' as options;

Color primaryColor = mycolors.CustomColors.primaryColor;
Color secondaryColor = mycolors.CustomColors.secondaryColor;


class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final List<String> titles = [
    "FIND JOKES",
    "SAVED JOKES",
    "OPTIONS",
  ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> images = [
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/findJokes.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.dstATop),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/savedJokes.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.dstATop),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/options.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.dstATop),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
      ),
    ];
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Expanded(
          child: Container(
            child: VerticalCardPager(
              textStyle:
              TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
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
              titles: titles,
              images: images,
              onPageChanged: (page) {},
              align: ALIGN.CENTER,
              onSelectedItem: (index) {
                navigate(index, context);
              },
            ),
          ),
        ),
      ),
    );
  }
}

void navigate(int index, BuildContext context){
  switch(index){
    case 0:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => categories.Categories()),
      );
      break;
    case 1:
    //do something
      break;
    case 2:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => options.Options()),
      );
      break;
    case 3:
    //do something
      break;
  }
}