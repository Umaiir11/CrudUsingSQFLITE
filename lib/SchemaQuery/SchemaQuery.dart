import 'package:sqflite/sqflite.dart';

class SchemaQuery {
  Future<void> FncCreateTable(Database l_DataBase) async {
    await l_DataBase.execute('''
      CREATE TABLE IF NOT EXISTS Users (
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

    await FncCheckAndAddColumns(l_DataBase, 'Users', {
      'DATA': 'INTEGER',
      'Number': 'TEXT',
      'Number45': 'TEXT',
      'Number955': 'TEXT',
    });

    await FncCreateView(l_DataBase, 'Users');
  }

  Future<void> FncCheckAndAddColumns(Database l_DataBase, String l_TableName, Map<String, String> l_ColumnsToAdd) async {
    List<Map<String, dynamic>> l_ExistingColumns = await l_DataBase.rawQuery('PRAGMA table_info($l_TableName)');
    List<String> l_ExistingColumnNames = l_ExistingColumns.map((column) => column['name'] as String).toList();

    List<String> l_NewColumnNames =
        l_ColumnsToAdd.keys.where((columnName) => !l_ExistingColumnNames.contains(columnName)).toList();

    for (String columnName in l_NewColumnNames) {
      String columnType = l_ColumnsToAdd[columnName]!;
      await l_DataBase.execute('ALTER TABLE $l_TableName ADD COLUMN $columnName $columnType');
    }
  }

  Future<void> FncCreateView(Database l_DataBase, String l_TableName) async {
    await l_DataBase.execute('DROP VIEW IF EXISTS ${l_TableName}View');

    await l_DataBase.execute('''
      CREATE VIEW ${l_TableName}View AS
      SELECT *
      FROM $l_TableName
    ''');
  }
}
