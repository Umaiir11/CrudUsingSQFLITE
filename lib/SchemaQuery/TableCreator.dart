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

    // Check if the columns "Country" and "Area" already exists in the table.
    List<Map<String, dynamic>> columns = await db.rawQuery('PRAGMA table_info(Users)');

    // If the columns do not exist, add them.
    if (!columns.any((column) => column['name'] == 'DATA') ||
        !columns.any((column) => column['name'] == 'Number') ||
        !columns.any((column) => column['name'] == 'test1') ||
        !columns.any((column) => column['name'] == 'test2') ||
        !columns.any((column) => column['name'] == 'test3')) {
      // Add columns
      await db.execute('''
      ALTER TABLE Users ADD DATA INTEGER
    ''');
      await db.execute('''
      ALTER TABLE Users ADD Number TEXT
    ''');
      await db.execute('''
      ALTER TABLE Users ADD test1 TEXT
    ''');
      await db.execute('''
      ALTER TABLE Users ADD test2 TEXT
    ''');
      await db.execute('''
      ALTER TABLE Users ADD test3 TEXT
    ''');
    }
  }
}
