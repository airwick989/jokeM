import 'package:flutter/material.dart';
import 'mycolors.dart' as mycolors;
import 'package:google_fonts/google_fonts.dart';

Color primaryColor = mycolors.CustomColors.primaryColor;
Color secondaryColor = mycolors.CustomColors.secondaryColor;

enum Languages { Czech, German, English, Spanish, French, Portuguese}
enum Blacklist { nsfw, religious, political, racist, sexist, explicit}

class Options extends StatefulWidget {
  const Options({super.key});

  @override
  _OptionsState createState() => _OptionsState();
}

class _OptionsState extends State<Options> {

  var _selectedLanguage = Languages.English;
  var _selectedBlacklist = Set<Blacklist>();
  var _skipIntro = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

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
                                  value: Languages.Czech,
                                  groupValue: _selectedLanguage,
                                  onChanged: (newValue) => setState(() => _selectedLanguage = newValue!),
                              ),
                              RadioListTile(
                                title: Text("German",
                                    style: GoogleFonts.montserrat(
                                        textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                        ))),
                                activeColor: primaryColor,
                                value: Languages.German,
                                groupValue: _selectedLanguage,
                                onChanged: (newValue) => setState(() => _selectedLanguage = newValue!),
                              ),
                              RadioListTile(
                                title: Text("English",
                                    style: GoogleFonts.montserrat(
                                        textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                        ))),
                                activeColor: primaryColor,
                                value: Languages.English,
                                groupValue: _selectedLanguage,
                                onChanged: (newValue) => setState(() => _selectedLanguage = newValue!),
                              ),
                              RadioListTile(
                                title: Text("Spanish",
                                    style: GoogleFonts.montserrat(
                                        textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                        ))),
                                activeColor: primaryColor,
                                value: Languages.Spanish,
                                groupValue: _selectedLanguage,
                                onChanged: (newValue) => setState(() => _selectedLanguage = newValue!),
                              ),
                              RadioListTile(
                                title: Text("French",
                                    style: GoogleFonts.montserrat(
                                        textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                        ))),
                                activeColor: primaryColor,
                                value: Languages.French,
                                groupValue: _selectedLanguage,
                                onChanged: (newValue) => setState(() => _selectedLanguage = newValue!),
                              ),
                              RadioListTile(
                                title: Text("Portuguese",
                                    style: GoogleFonts.montserrat(
                                        textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                        ))),
                                activeColor: primaryColor,
                                value: Languages.Portuguese,
                                groupValue: _selectedLanguage,
                                onChanged: (newValue) => setState(() => _selectedLanguage = newValue!),
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
                                    value: _selectedBlacklist.contains(Blacklist.nsfw),
                                    onChanged: (_){
                                      setState(() {
                                        _selectedBlacklist.contains(Blacklist.nsfw) //if
                                            ? _selectedBlacklist.remove(Blacklist.nsfw) //do if true
                                            : _selectedBlacklist.add(Blacklist.nsfw); //else
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
                                    value: _selectedBlacklist.contains(Blacklist.religious),
                                    onChanged: (_){
                                      setState(() {
                                        _selectedBlacklist.contains(Blacklist.religious) //if
                                            ? _selectedBlacklist.remove(Blacklist.religious) //do if true
                                            : _selectedBlacklist.add(Blacklist.religious); //else
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
                                    value: _selectedBlacklist.contains(Blacklist.political),
                                    onChanged: (_){
                                      setState(() {
                                        _selectedBlacklist.contains(Blacklist.political) //if
                                            ? _selectedBlacklist.remove(Blacklist.political) //do if true
                                            : _selectedBlacklist.add(Blacklist.political); //else
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
                                    value: _selectedBlacklist.contains(Blacklist.racist),
                                    onChanged: (_){
                                      setState(() {
                                        _selectedBlacklist.contains(Blacklist.racist) //if
                                            ? _selectedBlacklist.remove(Blacklist.racist) //do if true
                                            : _selectedBlacklist.add(Blacklist.racist); //else
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
                                    value: _selectedBlacklist.contains(Blacklist.sexist),
                                    onChanged: (_){
                                      setState(() {
                                        _selectedBlacklist.contains(Blacklist.sexist) //if
                                            ? _selectedBlacklist.remove(Blacklist.sexist) //do if true
                                            : _selectedBlacklist.add(Blacklist.sexist); //else
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
                                    value: _selectedBlacklist.contains(Blacklist.explicit),
                                    onChanged: (_){
                                      setState(() {
                                        _selectedBlacklist.contains(Blacklist.explicit) //if
                                            ? _selectedBlacklist.remove(Blacklist.explicit) //do if true
                                            : _selectedBlacklist.add(Blacklist.explicit); //else
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
                                    setState(() =>
                                      _skipIntro = newValue
                                    ),
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
}