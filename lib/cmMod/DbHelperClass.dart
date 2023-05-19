import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqfliteflutterdb/SchemaQuery/TableCreator.dart';


class DBHelper {
  static Database? _database;

  static Future<Database?> FncGetDatabaseIns() async {
    if (_database == null) {
      await FncCreateDataBase();
    }
    return _database;
  }

  static Future<void> FncCreateDataBase() async {
    final appDirectory = await getApplicationDocumentsDirectory();
    final dbDirectory = Directory('${appDirectory.path}/Usderr1');
    await dbDirectory.create(recursive: true);
    final dbPath = path.join(dbDirectory.path, 'T1T1.db');
    final databaseExists = await databaseFactory.databaseExists(dbPath);
    if (!databaseExists) {
      _database = await openDatabase(
        dbPath,
        version: 1,
      );
      final tableCreator = TableCreator();
      await tableCreator.FncCreateTable(_database!);
    } else {
      try {
        _database = await openDatabase(dbPath);
        final tableCreator = TableCreator();
        await tableCreator.FncCreateTable(_database!);
      } catch (e) {
        await deleteDatabase(dbPath);
        await FncCreateDataBase();
      }
    }
  }
}
