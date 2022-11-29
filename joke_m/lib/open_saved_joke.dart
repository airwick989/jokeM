import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:joke_m/jokes_database.dart';
import 'dart:ui';

import 'package:joke_m/mycolors.dart';


class OpenJoke extends StatefulWidget{
  final String text;

  OpenJoke({Key? key, required this.text}) : super(key: key);
  @override
  _OpenJokeState createState() => _OpenJokeState();
}


class _OpenJokeState extends State<OpenJoke>{
  var _jokeText = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setText();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 200,
          ),
          Center(
            child: Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width * 0.8,
                child: Text(_jokeText,
                  style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      )),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        showAlertDialog(context);
                      },
                      icon: const Icon(Icons.delete, size: 50),
                      color: Colors.redAccent,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text('Delete',
                      style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          )),
                      textAlign: TextAlign.center,
                    ),
                  ]
              ),
            ],
          ),
        ],
      ),
    );
  }

  void setText(){
    setState(() {
      _jokeText = widget.text;
    });
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
        onPressed: () async {
          await JokesDatabase.instance.delete(_jokeText);
          Navigator.pop(context);
          Navigator.pop(context, true);
        },
        child: Text(
          'Delete',
          style: GoogleFonts.montserrat(
              textStyle: const TextStyle(
                color: Colors.redAccent,
                fontSize: 17,
              )),
          textAlign: TextAlign.center,
        ),
    );

    Widget continueButton = TextButton(
      onPressed: (){
        Navigator.pop(context, true);
      },
      child: Text(
        'Nevermind',
        style: GoogleFonts.montserrat(
            textStyle: TextStyle(
              color: CustomColors.primaryColor,
              fontSize: 17,
            )),
        textAlign: TextAlign.center,
      ),
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        'Delete Joke?',
        style: GoogleFonts.montserrat(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 17,
            )),
        textAlign: TextAlign.center,
      ),
      content: Text(
        'Are you sure you want to delete this joke from your saved jokes?',
        style: GoogleFonts.montserrat(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 17,
            )),
        textAlign: TextAlign.center,
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
      backgroundColor: CustomColors.secondaryColor,
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

}