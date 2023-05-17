import 'dart:io';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class DBHelper extends GetxController {
  Database? l_Database;

  Future<Database?> FncGetDatabase() async {
    if (l_Database == null) {
      await FncCreateDataBase();
    }
    return l_Database;
  }

  Future<void> FncCreateDataBase() async {
    final appDirectory = await getApplicationDocumentsDirectory();
    final dbDirectory = Directory('${appDirectory.path}/sqfliteT');
    await dbDirectory.create(recursive: true);
    final dbPath = path.join(dbDirectory.path, 'DBb1.db');
    final databaseExists = await databaseFactory.databaseExists(dbPath);
    if (databaseExists) {
      l_Database = await openDatabase(dbPath);
    } else {
      l_Database = await openDatabase(
        dbPath,
        version: 1,
        onCreate: (db, version) async {
          await db.execute('''
            CREATE TABLE Users (
              id INTEGER PRIMARY KEY,
              Fname TEXT,
              Lname TEXT,
              EmailID TEXT,
              CompanyID TEXT,
              Address TEXT,
              PKGUID TEXT
            )
          ''');
        },
      );
    }
  }





}
