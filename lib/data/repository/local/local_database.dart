import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// 인터페이스
abstract class ILocalDatabase {
  Future<int> insertUser(Map<String, dynamic> user);
  Future<List<Map<String, dynamic>>> getUsers();
  Future<int> updateUser(Map<String, dynamic> user);
  Future<int> deleteUser(int id);
}

// 구현체
class LocalDatabaseImpl implements ILocalDatabase {
  final Database database;

  LocalDatabaseImpl(this.database);

  @override
  Future<int> insertUser(Map<String, dynamic> user) async {
    return await database.insert('users', user);
  }

  @override
  Future<List<Map<String, dynamic>>> getUsers() async {
    return await database.query('users');
  }

  @override
  Future<int> updateUser(Map<String, dynamic> user) async {
    return await database.update(
      'users',
      user,
      where: 'id = ?',
      whereArgs: [user['id']],
    );
  }

  @override
  Future<int> deleteUser(int id) async {
    return await database.delete(
      'users',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}

class DatabaseHelper {
  static Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), 'my_db.db');

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
          CREATE TABLE users(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            email TEXT NOT NULL
          )
        ''');
    });
  }
}
