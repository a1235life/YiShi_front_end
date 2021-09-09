
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'file_entity.dart';

class DBUtils {
  static Database database;
  static DBUtils _dbUtils;
  static String dbName = 'file.db';
  static int dbVersion = 1;
  static Future<DBUtils> instance() async {
    if (database == null) {
      var databasesPath = await getDatabasesPath();
      String path = join(databasesPath, dbName);
      database = await openDatabase(path,version: dbVersion,onCreate: (db, version)async{
        await createTable(db);
      });

      _dbUtils = DBUtils();
      return _dbUtils;
    }
    return _dbUtils;
  }

  static Future<void> createTable(Database database) async {
    await database.execute("""
    create table fileCollection(
    id INTEGER PRIMARY KEY,
    articleName TEXT,
    location TEXT,
    weight INTEGER,
    coverPic TEXT
    )
    """);
    await database.execute("""
    create table book(
    id INTEGER  PRIMARY KEY AUTOINCREMENT,
    title TEXT,
    content TEXT,
    time TEXT
    )
    """);
  }


  Future<int> insert({Result game}) async {
    var id = await database.insert("fileCollection", game.toSql(),conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }
  Future<int> delete({int fileId}) async {
    var id = await database.delete("fileCollection", where: 'id = ?', whereArgs: [fileId]);
    return id;
  }

  Future<List<Result>> getAllDownloadGames () async {
    List<Map<String,dynamic>> data= await database.query("fileCollection");
    return data.map((e) => Result.fromSql(e)).toList();
  }

  Future<bool> queryIsCollection ({int fileId}) async {
    List<Map<String,dynamic>> data= await database.query("fileCollection",where: 'id = ?',whereArgs: [fileId]);
    return data.isNotEmpty;
  }

  Future<int> insertBook({Book game}) async {
    var id = await database.insert("book", game.toJson(),conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }
  Future<int> deleteBook({int fileId}) async {
    var id = await database.delete("book", where: 'id = ?', whereArgs: [fileId]);
    return id;
  }

  Future<List<Book>> getAllBooks () async {
    List<Map<String,dynamic>> data= await database.query("book");
    return data.map((e) => Book.fromJson(e)).toList();
  }

  Future<List<Book>> queryTitle ({String title}) async {
    print(title);
    List<Map<String,dynamic>> data= await database.query("book",where: 'title like ?',whereArgs: ["%$title%"]);
    return data.map((e) => Book.fromJson(e)).toList();
  }

}


class Book {
  String title;
  int id;
  String content;
  String time;

  Book({
    this.title,
    this.id,
    this.content,
    this.time});

  Book.fromJson(dynamic json) {
    title = json["title"];
    id = json["id"];
    content = json["content"];
    time = json["time"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["title"] = title;
    map["id"] = id;
    map["content"] = content;
    map["time"] = time;
    return map;
  }

}
