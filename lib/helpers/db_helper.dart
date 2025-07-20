import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DBHelper {
  // singletone
  static final DBHelper _instance = DBHelper._internal();

  factory DBHelper() => _instance;

  DBHelper._internal();

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;

    _db = await initDB();

    return _db!;
  }

  Future<Database> initDB() async {
    final dbPath = await getDatabasesPath(); // location
    final path = join(dbPath, 'tasks.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          '''CREATE TABLE tasks (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, isDone INTEGER)''',
        );
      },
    );
  }

  Future<int> insertTask(String title) async {
    final dbClient = await db;
    return await dbClient.insert('tasks', {'title': title, 'isDone': 0});
  }

  Future<List<Map<String, dynamic>>> getTasks() async {
    final dbClient = await db;
    return await dbClient.query('tasks');
  }

  Future<int> updateTask(int id, int isDone) async {
    final dbClient = await db;
    return await dbClient.update('tasks', {'isDone' : isDone}, where : 'id = ?', whereArgs : [id]);
  }

  Future<int> deleteTask(int id) async {
    final dbClient = await db;
    return await dbClient.delete('tasks' , where: 'id = ?' , whereArgs: [id]);

  }
}
