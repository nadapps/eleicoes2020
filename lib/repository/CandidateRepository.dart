import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CandidateRepository {
  static final _databaseName = "eleicoes2020DB.db";
  static final _databaseVersion = 1;
  String table;

  CandidateRepository._privateConstructor();
  static final CandidateRepository instance =
      CandidateRepository._privateConstructor();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  setTable(String table) {
    this.table = table;
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE mayor (
        id INTEGER PRIMARY KEY,
        name TEXT NOT NULL,
        photo TEXT NOT NULL,
        number INTEGER NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE alderman (
        id INTEGER PRIMARY KEY,
        name TEXT NOT NULL,
        photo TEXT NOT NULL,
        number INTEGER NOT NULL
      );
    ''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(this.table, row);
  }

  Future<int> save(Map<String, dynamic> row, bool status) async {
    if (status) {
      return await this.insert(row);
    }

    return await this.delete(row['id']);
  }

  Future<List<Map<String, dynamic>>> allMayor() async {
    Database db = await instance.database;
    return await db.query('mayor');
  }

  Future<List<Map<String, dynamic>>> allAlderman() async {
    Database db = await instance.database;
    return await db.query('alderman');
  }

  Future<Map<String, dynamic>> getRow(int id) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> list =
        await db.query(this.table, where: 'id = ?', whereArgs: [id]);

    if (list.length > 0) {
      return list[0];
    }

    return null;
  }

  Future<int> getRowCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM ${this.table}'));
  }

  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(this.table, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteAll() async {
    Database db = await instance.database;
    return await db.delete('mayor') + await db.delete('alderman');
  }
}
