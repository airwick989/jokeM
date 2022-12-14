import 'dart:io';

import 'package:flutter/material.dart';
import 'package:joke_m/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'mycolors.dart' as mycolors;
import 'package:google_fonts/google_fonts.dart';
import 'preferences_database.dart';
import 'package:path_provider/path_provider.dart';

Color primaryColor = mycolors.CustomColors.primaryColor;
Color secondaryColor = mycolors.CustomColors.secondaryColor;


class Options extends StatefulWidget {
  const Options({super.key});

  @override
  _OptionsState createState() => _OptionsState();
}

class _OptionsState extends State<Options> {

  var _selectedLanguage;
  var _selectedBlacklist = Set<String>();
  var _skipIntro = false;
  var _preferences;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Options'),
        backgroundColor: primaryColor,
      ),
      backgroundColor: Colors.black,
      //hit Ctrl+space in intellij to know what are the options you can use in flutter widgets
      body: SingleChildScrollView(
        child: Column(
            children: <Widget>[
              Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 30,
                    ),
                    Text('Language',
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            color: secondaryColor,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Container(
                        alignment: Alignment.center,
                        height: 380,
                        width: 300,
                        decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Container(
                          margin: const EdgeInsets.all(20.0),
                          child: ListView(
                            children: [
                              RadioListTile(
                                  title: Text("Czech",
                                    style: GoogleFonts.montserrat(
                                        textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                        ))),
                                activeColor: primaryColor,
                                  value: "cs",
                                  groupValue: _selectedLanguage,
                                  onChanged: (newValue) => setState(() {
                                    _selectedLanguage = newValue!;
                                    _saveSettings();
                                  }),
                              ),
                              RadioListTile(
                                title: Text("German",
                                    style: GoogleFonts.montserrat(
                                        textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                        ))),
                                activeColor: primaryColor,
                                value: "de",
                                groupValue: _selectedLanguage,
                                onChanged: (newValue) => setState(() {
                                  _selectedLanguage = newValue!;
                                  _saveSettings();
                                }),
                              ),
                              RadioListTile(
                                title: Text("English",
                                    style: GoogleFonts.montserrat(
                                        textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                        ))),
                                activeColor: primaryColor,
                                value: "en",
                                groupValue: _selectedLanguage,
                                onChanged: (newValue) => setState(() {
                                  _selectedLanguage = newValue!;
                                  _saveSettings();
                                }),
                              ),
                              RadioListTile(
                                title: Text("Spanish",
                                    style: GoogleFonts.montserrat(
                                        textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                        ))),
                                activeColor: primaryColor,
                                value: "es",
                                groupValue: _selectedLanguage,
                                onChanged: (newValue) => setState(() {
                                  _selectedLanguage = newValue!;
                                  _saveSettings();
                                }),
                              ),
                              RadioListTile(
                                title: Text("French",
                                    style: GoogleFonts.montserrat(
                                        textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                        ))),
                                activeColor: primaryColor,
                                value: "fr",
                                groupValue: _selectedLanguage,
                                onChanged: (newValue) => setState(() {
                                  _selectedLanguage = newValue!;
                                  _saveSettings();
                                }),
                              ),
                              RadioListTile(
                                title: Text("Portuguese",
                                    style: GoogleFonts.montserrat(
                                        textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                        ))),
                                activeColor: primaryColor,
                                value: "pt",
                                groupValue: _selectedLanguage,
                                onChanged: (newValue) => setState(() {
                                  _selectedLanguage = newValue!;
                                  _saveSettings();
                                }),
                              ),
                            ],
                          ),
                        ),
                      )
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text('Blacklisted Jokes',
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            color: secondaryColor,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                        child: Container(
                          alignment: Alignment.center,
                          height: 380,
                          width: 300,
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Container(
                            margin: const EdgeInsets.all(20.0),
                            child: ListView(
                              children: [
                                CheckboxListTile(
                                    title: Text("NSFW",
                                        style: GoogleFonts.montserrat(
                                            textStyle: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 17,
                                            ))),
                                    activeColor: primaryColor,
                                    value: _selectedBlacklist.contains("nsfw"),
                                    onChanged: (_){
                                      setState(() {
                                        _selectedBlacklist.contains("nsfw") //if
                                            ? _selectedBlacklist.remove("nsfw") //do if true
                                            : _selectedBlacklist.add("nsfw");
                                            _saveSettings();//else
                                      });
                                    }
                                ),
                                CheckboxListTile(
                                    title: Text("Religious",
                                        style: GoogleFonts.montserrat(
                                            textStyle: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 17,
                                            ))),
                                    activeColor: primaryColor,
                                    value: _selectedBlacklist.contains("religious"),
                                    onChanged: (_){
                                      setState(() {
                                        _selectedBlacklist.contains("religious") //if
                                            ? _selectedBlacklist.remove("religious") //do if true
                                            : _selectedBlacklist.add("religious");
                                            _saveSettings();//else
                                      });
                                    }
                                ),
                                CheckboxListTile(
                                    title: Text("Political",
                                        style: GoogleFonts.montserrat(
                                            textStyle: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 17,
                                            ))),
                                    activeColor: primaryColor,
                                    value: _selectedBlacklist.contains("political"),
                                    onChanged: (_){
                                      setState(() {
                                        _selectedBlacklist.contains("political") //if
                                            ? _selectedBlacklist.remove("political") //do if true
                                            : _selectedBlacklist.add("political");
                                            _saveSettings();//else
                                      });
                                    }
                                ),
                                CheckboxListTile(
                                    title: Text("Racist",
                                        style: GoogleFonts.montserrat(
                                            textStyle: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 17,
                                            ))),
                                    activeColor: primaryColor,
                                    value: _selectedBlacklist.contains("racist"),
                                    onChanged: (_){
                                      setState(() {
                                        _selectedBlacklist.contains("racist") //if
                                            ? _selectedBlacklist.remove("racist") //do if true
                                            : _selectedBlacklist.add("racist");
                                            _saveSettings();//else
                                      });
                                    }
                                ),
                                CheckboxListTile(
                                    title: Text("Sexist",
                                        style: GoogleFonts.montserrat(
                                            textStyle: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 17,
                                            ))),
                                    activeColor: primaryColor,
                                    value: _selectedBlacklist.contains("sexist"),
                                    onChanged: (_){
                                      setState(() {
                                        _selectedBlacklist.contains("sexist") //if
                                            ? _selectedBlacklist.remove("sexist") //do if true
                                            : _selectedBlacklist.add("sexist"); //else
                                            _saveSettings();
                                      });
                                    }
                                ),
                                CheckboxListTile(
                                    title: Text("Explicit",
                                        style: GoogleFonts.montserrat(
                                            textStyle: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 17,
                                            ))),
                                    activeColor: primaryColor,
                                    value: _selectedBlacklist.contains("explicit"),
                                    onChanged: (_){
                                      setState(() {
                                        _selectedBlacklist.contains("explicit") //if
                                            ? _selectedBlacklist.remove("explicit") //do if true
                                            : _selectedBlacklist.add("explicit"); //else
                                            _saveSettings();
                                      });
                                    }
                                ),
                              ],
                            )
                          ),
                        )
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text('Skip Welcome Sceens?',
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            color: secondaryColor,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                        child: Container(
                          alignment: Alignment.center,
                          height: 100,
                          width: 300,
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Container(
                              margin: const EdgeInsets.all(20.0),
                              child: SwitchListTile(
                                title: Text("Skip",
                                    style: GoogleFonts.montserrat(
                                        textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                        ))),
                                activeColor: primaryColor,
                                value: _skipIntro,
                                onChanged: (newValue) =>
                                    setState(() {
                                      _skipIntro = newValue;
                                      _saveSettings();
                                    }),
                              )
                          ),
                        )
                    ),
                  ],
                ),
            ]
        ),
      )
    );
  }


  Future _saveSettings() async {
    var orderedBlacklist = Set<String>();
    String strBlacklist = "";

    //The Joke API requires the list of blacklisted joke types in a specific order
    if(_selectedBlacklist.contains("nsfw")) {
      orderedBlacklist.add("nsfw");
    }
    if(_selectedBlacklist.contains("religious")) {
      orderedBlacklist.add("religious");
    }
    if(_selectedBlacklist.contains("political")) {
      orderedBlacklist.add("political");
    }
    if(_selectedBlacklist.contains("racist")) {
      orderedBlacklist.add("racist");
    }
    if(_selectedBlacklist.contains("sexist")) {
      orderedBlacklist.add("sexist");
    }
    if(_selectedBlacklist.contains("explicit")) {
      orderedBlacklist.add("explicit");
    }


    if(orderedBlacklist.length == 1){
      strBlacklist = orderedBlacklist.elementAt(0);
    }
    else if(orderedBlacklist.length > 1){
      orderedBlacklist.forEach((element) {
        if(strBlacklist == ""){
          strBlacklist = element;
        }
        else{
          strBlacklist = "$strBlacklist,$element";
        }
      });
    }



    final newPreferences = Preferences(
      id: 1,
      language: _selectedLanguage,
      blacklist: strBlacklist,
      skip: _skipIntro ? 1 : 0
    );
    //await PrefsDatabase.instance.create(newPreferences);
    await PrefsDatabase.instance.update(newPreferences);


    // print(newPreferences.language);
    //print(newPreferences.blacklist);
    // print(newPreferences.skip);
    // print("\n");
  }

  Future<void> getPreferences() async {
    final Preferences preferences = await PrefsDatabase.instance.readPreferences(1);

    setState(() {
      _preferences = preferences;
      _selectedLanguage = _preferences.language;

      if(!_preferences.blacklist.isEmpty){
        final split = _preferences.blacklist.split(',');
        split.forEach((element) {
          _selectedBlacklist.add(element);
        });
      }

      _preferences.skip == 1 ? _skipIntro = true : _skipIntro = false;
    });
  }


}