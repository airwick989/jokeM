import 'package:flutter/material.dart';
import 'mycolors.dart' as mycolors;
import 'package:google_fonts/google_fonts.dart';

final PageController _pageViewController = PageController(initialPage: 0);


class ScrollableIntro extends StatefulWidget {
  const ScrollableIntro({super.key});

  @override
  State<ScrollableIntro> createState() => _ScrollableIntroState();
}


class _ScrollableIntroState extends State<ScrollableIntro> {

  double scrollingProgress = 0.25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: <Widget>[
            Container(
              height: 6.0,
              width: MediaQuery.of(context).size.width * scrollingProgress,
              decoration: BoxDecoration(
                  color: mycolors.CustomColors.primaryColor),
            ),
            Expanded(
              child: Container(
                height: 6.0,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: mycolors.CustomColors.secondaryColor),
              ),
            )
          ],
        ),
      ),
      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: _pageViewController,
        onPageChanged: _onPageViewChange,
        children: <Widget>[
          Center(
            child: Text('First Page',
              style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  )),
            ),
          ),
          Center(
            child: Text('Second Page',
              style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  )),
            ),
          ),
          Center(
            child: Text('Third Page',
              style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  )),
            ),
          ),
          Center(
            child: Text('Fourth Page',
              style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  )),
            ),
          ),
        ],
      ),
    );
  }

  _onPageViewChange(int page){
    setState(() {
      scrollingProgress = 0.25*(page + 1);
    });
  }

}