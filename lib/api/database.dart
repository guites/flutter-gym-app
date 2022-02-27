import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DB {
  static final DB _db = DB._internal();
  DB._internal();

  // este boolean previne a criação de multiplas instâncias de conexão com o banco de dados.
  bool initialized = false;
  static DB get instance => _db;
  static late Database _database;

  Future<Database> get database async {
    if (initialized) {
      return _database;
    }
    _database = await _init();
    initialized = true;
    return _database;
  }

  Future<Database> _init() async {
    var dbDir = await getDatabasesPath();
    var dbPath = join(dbDir, "app.sqlite");
    await deleteDatabase(dbPath);

    ByteData data = await rootBundle.load("assets/exercises_only.sqlite3");
    List<int> bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    await File(dbPath).writeAsBytes(bytes);

    return await openDatabase(join(dbPath));
  }
}
