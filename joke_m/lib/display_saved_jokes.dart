import 'package:flutter/material.dart';
import 'package:joke_m/categories.dart';
import 'package:joke_m/jokes_database.dart';
import 'package:joke_m/saved_joke.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

class SavedJokes extends StatefulWidget{
  const SavedJokes({super.key});
  @override
  _SavedJokesState createState() => _SavedJokesState();
}


class _SavedJokesState extends State<SavedJokes> {
  late List<Joke> jokes;
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    refreshJokes();
  }


  Future refreshJokes() async {
    setState(() => isLoading = true);

    jokes = await JokesDatabase.instance.readAllJokes();

    setState(() => isLoading = false);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: masonryLayout(context),
      ),
    );
  }


  Widget masonryLayout(BuildContext context){
    return MasonryGridView.builder(
        gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: jokes.length,
        padding: EdgeInsets.all(10),
        itemBuilder: (context, index){
          return ListTile(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
            title: Text(jokes[index].text,
              style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  )),
              textAlign: TextAlign.center,
            ),
            tileColor: index%2 == 0 ? primaryColor : secondaryColor,
            contentPadding: EdgeInsets.all(8),
            onTap: (){

            },
          );
        }
    );
  }

}