import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:joke_m/preferences_database.dart';
import 'dart:convert' as converter;

import 'package:joke_m/shared_preferences.dart';

class JokePage extends StatefulWidget{
  final String category;

  JokePage({Key? key, required this.category}) : super(key: key);
  @override
  _JokePageState createState() => _JokePageState();
}


class _JokePageState extends State<JokePage>{
  var _jsonData = Map<String, dynamic>();
  var _jokeText = "";
  var _selectedLanguage;
  var _selectedBlacklist;
  var _isError;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getPreferences();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 100,
          ),
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.7,
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
        ],
      ),
    );
  }


  Future<void> getPreferences() async {
    final Preferences preferences = await PrefsDatabase.instance.readPreferences(1);

    setState(() {
      _selectedLanguage = preferences.language;
      _selectedBlacklist = preferences.blacklist;
    });

    getJoke();
  }


  Future<void> getJoke() async{

    //Build the url
    var url = 'https://v2.jokeapi.dev/joke/${widget.category}';
    if(_selectedLanguage != "en" || _selectedBlacklist != ""){
      url = "$url?";
    }
    if(_selectedLanguage != "en"){
      url = "$url" "lang=$_selectedLanguage";
    }
    if(_selectedLanguage != "en" && _selectedBlacklist != ""){
      url = "$url&";
    }
    if(_selectedBlacklist != ""){
      url = "$url" "blacklistFlags=$_selectedBlacklist";
    }
    print(url);

    // await response from the url
    var response = await http.get(Uri.parse(url));

    if(response.statusCode == 200){
      var jsonData = converter.jsonDecode(response.body);
      _jsonData = jsonData;
      if(_jsonData["error"] == false){
        setState(() {
          _isError = false;

          if(_jsonData["type"] == "single"){
            _jokeText = _jsonData["joke"];
          } else {
            _jokeText = _jsonData["setup"] + "\n" + _jsonData["delivery"];
          }

        });
      } else{
        setState(() {
          _isError = true;
          _jokeText = "Sorry!\nThere is no joke matching your selected preferences!\n"
              "Maybe you shouldn't be so picky ;)";
        });
      }

    }
    else {
      throw Exception('Error retrieving API response');
    }
  }

}