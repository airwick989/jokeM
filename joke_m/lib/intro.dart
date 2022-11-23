import 'package:flutter/material.dart';
import 'mycolors.dart' as mycolors;
import 'package:google_fonts/google_fonts.dart';
import 'menu.dart' as menu;

final PageController _pageViewController = PageController(initialPage: 0);
Color secondaryColor = mycolors.CustomColors.secondaryColor;

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
          Column(
            children: <Widget>[
              Image.asset(
                'images/knockKnockImage.png',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.6,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                child: Text('Knock Knock!\nWho\'s there?',
                  style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      )),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 0.7,
                child: Center(
                    child: Text('It\'s your handy-dandy joke app!\n\nWe\'re'
                        ' glad you\'re here and we hope you got the lungs for all the'
                        ' laughing you\'re gonna be doing!',
                    style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        )),
                      textAlign: TextAlign.center,
                    )
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Image.asset(
                'images/laughterImage.png',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.6,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                child: Text('Did you know?',
                  style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      )),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width * 0.7,
                child: Center(
                    child: Text('Laughter can help relieve pain, bring greater happiness,'
                        ' and even increase immunity.',
                      style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          )),
                      textAlign: TextAlign.center,
                    )
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Image.asset(
                'images/laughterImage2.png',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.6,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                child: Text('But also...',
                  style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      )),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width * 0.7,
                child: Center(
                    child: Text('Laughing too hard can lead to asphyxiation or suffocation,'
                        ' possibly resulting in death.',
                      style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          )),
                      textAlign: TextAlign.center,
                    )
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Image.asset(
                'images/takeoffImage.png',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.6,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                child: Text('Just kidding! (not)',
                  style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      )),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width * 0.7,
                child: Center(
                    child: Text('Anyways, lets get joking!',
                      style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          )),
                      textAlign: TextAlign.center,
                    )
                ),
              ),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const menu.Menu()),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(secondaryColor),
                        ),
                        child: const Text('Get Started',
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