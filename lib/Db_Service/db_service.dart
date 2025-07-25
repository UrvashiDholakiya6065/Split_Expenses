import 'package:path/path.dart';
import 'package:splitexpenses_app/Models/Group_Model/group_model.dart';
import 'package:sqflite/sqflite.dart';

class DbService {
  static final DbService instance = DbService._init();
  static Database? _database;

  DbService._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('split_expense.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createTables);
  }

  Future<void> _createTables(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        email TEXT
      );
    ''');

    await db.execute('''
      CREATE TABLE groups (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL
      );
    ''');

    await db.execute('''
      CREATE TABLE group_members (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        group_id INTEGER,
        user_id INTEGER,
        FOREIGN KEY(group_id) REFERENCES groups(id),
        FOREIGN KEY(user_id) REFERENCES users(id)
      );
    ''');

    await db.execute('''
      CREATE TABLE expenses (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        group_id INTEGER,
        title TEXT,
        amount REAL,
        paid_by INTEGER,
        datetime TEXT,
        FOREIGN KEY(group_id) REFERENCES groups(id),
        FOREIGN KEY(paid_by) REFERENCES users(id)
      );
    ''');

    await db.execute('''
      CREATE TABLE expense_splits (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        expense_id INTEGER,
        user_id INTEGER,
        amount REAL,
        FOREIGN KEY(expense_id) REFERENCES expenses(id),
        FOREIGN KEY(user_id) REFERENCES users(id)
      );
    ''');
  }

//   Future<GroupModel> insertGroup(GroupModel groupModel) async {
//     final db = await DbService.instance.database;
//     db.insert('groups', groupModel.toMap());
//     return groupModel;
//   }
//
//   Future<List<Map<String, Object?>>> getAllGroups() async {
//     final db = await DbService.instance.database;
//     return await db.query('groups');
//   }
// }
  Future<void> insertSplit(Map<String, dynamic> row) async {
    final db = await database;
    await db.insert('groups', row);
  }

  Future<List<Map<String, dynamic>>> getSplit() async {
    Database db = await database;
    return await db.query('groups');
  }


}