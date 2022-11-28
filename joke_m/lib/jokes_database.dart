import 'saved_joke.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class JokesDatabase{
  static final JokesDatabase instance = JokesDatabase._init();

  static Database? _database;

  JokesDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('jokes.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }


  Future _createDB(Database db, int version) async{

    await db.execute('''
    CREATE TABLE $tableJokes (
      ${JokeFields.text} TEXT PRIMARY KEY
      )
    ''');
  }


  create(Joke joke) async{
    final db = await instance.database;
    await db.insert(tableJokes, joke.toJson());
  }


  Future<Joke> readJoke(String text) async {
    final db = await instance.database;

    final maps = await db.query(
      tableJokes,
      columns: JokeFields.values,
      where: '${JokeFields.text} = ?',
      whereArgs: [text],
    );

    if(maps.isNotEmpty){
      return Joke.fromJson(maps.first);
    } else {
      throw Exception('Joke not found');
    }
  }


  Future<List<Joke>> readAllJokes() async {
    final db = await instance.database;
    final result = await db.query(tableJokes);
    return result.map((json) => Joke.fromJson(json)).toList();
  }


  Future<int> delete(String text) async {
    final db = await instance.database;

    return await db.delete(
      tableJokes,
      where: '${JokeFields.text} = ?',
      whereArgs: [text],
    );
  }


  Future close() async {
    final db = await instance.database;
    db.close();
  }
}