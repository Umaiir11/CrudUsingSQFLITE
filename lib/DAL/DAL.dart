import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqfliteflutterdb/MVVM/Model/DB/ModUserDB.dart';

import '../cmMod/DbHelperClass.dart';

class DAL extends GetxController {
  Fnc_CudUser(List<ModUserDB> l_UserList) async {
    Database? l_Database = await DBHelper().FncGetDatabaseIns();
    List<String> l_InsertionQuery = await FncGenCrudQueries(l_UserList);

    final batch = l_Database!.batch();
    for (int indexoflist = 0; indexoflist < l_InsertionQuery.length; indexoflist++) {
      final query = l_InsertionQuery[indexoflist];
      batch.execute(query);
    }
    await batch.commit();

    // Clear the list after the data is stored on the database.
    l_UserList.clear();
  }

  Future<List<String>> FncGenCrudQueries(List<ModUserDB> l_UserList) async {
    List<String> l_Queries = [];

    for (ModUserDB l_ModUserDB in l_UserList) {
      if (l_ModUserDB.Pr_Operation == 1) {
        final query = '''
        INSERT INTO Userss (
          Fname, Lname, EmailID, CompanyID, Operation, PKGUID
        ) VALUES (
          '${l_ModUserDB.Pr_Fname}', '${l_ModUserDB.Pr_Lname}', '${l_ModUserDB.Pr_EmailID}', 
          '${l_ModUserDB.Pr_CompanyID}', '${l_ModUserDB.Pr_Operation}', '${l_ModUserDB.Pr_PKGUID}'
        )
      ''';
        l_Queries.add(query);
      } else if (l_ModUserDB.Pr_Operation == 2) {
        final query = '''
        UPDATE Userss SET
          Fname = '${l_ModUserDB.Pr_Fname}',
          Lname = '${l_ModUserDB.Pr_Lname}',
          EmailID = '${l_ModUserDB.Pr_EmailID}',
          CompanyID = '${l_ModUserDB.Pr_CompanyID}',
          Operation = '${l_ModUserDB.Pr_Operation}'
        WHERE Fname = '${l_ModUserDB.Pr_Fname}'
          AND Lname = '${l_ModUserDB.Pr_Lname}'
      ''';
        l_Queries.add(query); // Add the query to the list
      } else if (l_ModUserDB.Pr_Operation == 3) {
        final query = '''
        DELETE FROM Userss
        WHERE Fname = '${l_ModUserDB.Pr_Fname}'
          AND Lname = '${l_ModUserDB.Pr_Lname}'
      ''';
        l_Queries.add(query);
      }
    }

    return l_Queries;
  }
}
