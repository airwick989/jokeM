import 'dart:ui';
import 'package:flutter/material.dart';
import 'mycolors.dart' as mycolors;
import 'package:google_fonts/google_fonts.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';

Color primaryColor = mycolors.CustomColors.primaryColor;
Color secondaryColor = mycolors.CustomColors.secondaryColor;


class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  final List<String> titles = [
    "CODING JOKES",
    "VARIED JOKES",
    "DARK JOKES",
    "PUNS",
    "SPOOKY JOKES",
    "CHRISTMAS JOKES",
    "ANY",
  ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> images = [
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/programming.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.dstATop),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/varied.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.dstATop),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/dark.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.dstATop),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/puns.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.dstATop),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/spooky.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.dstATop),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/christmas.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.dstATop),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/any.png'),
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
                //Do something
              },
            ),
          ),
        ),
      ),
    );
  }
}