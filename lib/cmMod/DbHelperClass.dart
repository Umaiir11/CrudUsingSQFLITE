import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqfliteflutterdb/SchemaQuery/TableCreator.dart';

class DBHelper {
   Database? l_Database;

   Future<Database?> FncGetDatabaseIns() async {
    if (l_Database == null) {
      await FncCreateDataBase();
    }
    return l_Database;
  }

   Future<void> FncCreateDataBase() async {
    final appDirectory = await getApplicationDocumentsDirectory();
    final dbDirectory = Directory('${appDirectory.path}/Usderr1');
    await dbDirectory.create(recursive: true);
    final dbPath = path.join(dbDirectory.path, 'T1T1.db');
    final databaseExists = await databaseFactory.databaseExists(dbPath);
    if (!databaseExists) {
      l_Database = await openDatabase(
        dbPath,
        version: 1,

      );
      final tableCreator = TableCreator();
      await tableCreator.FncCreateTable(l_Database!);
    } else {
      try {
        l_Database = await openDatabase(dbPath);
        final tableCreator = TableCreator();
        await tableCreator.FncCreateTable(l_Database!);
      } catch (e) {
        await deleteDatabase(dbPath);
        await FncCreateDataBase();
      }
    }
  }
}
