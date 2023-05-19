import 'package:sqflite/sqflite.dart';

class TableCreator {
  Future<void> FncCreateTable(Database db) async {
    await db.execute('''
      CREATE TABLE Users (
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

    List<Map<String, dynamic>> columns = await db.rawQuery('PRAGMA table_info(Users)');

    // If the columns do not exist, add them.
    if (!columns.any((column) => column['name'] == 'DATA') ||
        !columns.any((column) => column['name'] == 'Number') ||
        !columns.any((column) => column['name'] == 'Number2') ||
        !columns.any((column) => column['name'] == 'test4')) {
      // Add columns
      await db.execute('''
      ALTER TABLE Users ADD DATA INTEGER
    ''');
      await db.execute('''
      ALTER TABLE Users ADD Number TEXT
    ''');
   await db.execute('''
      ALTER TABLE Users ADD Number2 TEXT
    ''');

      await db.execute('''
      ALTER TABLE Users ADD test4 TEXT
    ''');
    }
  }
}
