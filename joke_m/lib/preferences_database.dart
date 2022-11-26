import 'package:joke_m/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class PrefsDatabase{
  static final PrefsDatabase instance = PrefsDatabase._init();

  static Database? _database;

  PrefsDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('preferences.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }


  Future _createDB(Database db, int version) async{
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final textTypeNullable = 'TEXT';
    final boolType = 'BOOLEAN NOT NULL';

    await db.execute('''
    CREATE TABLE $tablePreferences (
      ${PreferenceFields.id} $idType,
      ${PreferenceFields.language} $textType,
      ${PreferenceFields.blacklist} $textTypeNullable,
      ${PreferenceFields.skip} $boolType
      )
    ''');
  }


  Future<Preferences> create(Preferences preferences) async{
    final db = await instance.database;
    final id = await db.insert(tablePreferences, preferences.toJson());
    return preferences.copy(id: id);
  }


  Future<Preferences> readPreferences(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tablePreferences,
      columns: PreferenceFields.values,
      where: '${PreferenceFields.id} = ?',
      whereArgs: [id],
    );

    if(maps.isNotEmpty){
      return Preferences.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }


  Future<int> update(Preferences preferences) async {
    final db = await instance.database;

    return db.update(
        tablePreferences,
        preferences.toJson(),
        where: '${PreferenceFields.id} = ?',
        whereArgs:  [preferences.id],
    );
  }


  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
        tablePreferences,
        where: '${PreferenceFields.id} = ?',
        whereArgs: [id],
    );
  }


  Future close() async {
    final db = await instance.database;
    db.close();
  }
}