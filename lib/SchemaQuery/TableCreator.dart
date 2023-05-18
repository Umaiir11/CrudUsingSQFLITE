import 'package:sqflite/sqflite.dart';

class TableCreator {
  Future<void> createTable(Database db) async {
    await db.execute('''
      CREATE TABLE Userss (
        id INTEGER PRIMARY KEY,
        Fname TEXT,
        Lname TEXT,
        EmailID TEXT,
        CompanyID TEXT,
        Address TEXT,
        PKGUID TEXT,
        Operation INTEGER
      )
    ''');
  }
}
