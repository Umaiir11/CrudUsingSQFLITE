import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

import '../MVVM/Model/DB/ModUserDB.dart';
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
  }


  Future<List<String>> FncGenCrudQueries(List<ModUserDB> l_UserList) async {
    List<String> l_InsertionQueries = [];



    for (ModUserDB user in l_UserList) {
      final query = '''
      INSERT INTO Users (
        Fname, Lname, EmailID, CompanyID, Address, PKGUID
      ) VALUES (
        '${user.Pr_Fname}', '${user.Pr_Lname}', '${user.Pr_EmailID}', '${user.Pr_CompanyID}', '${user.Pr_Address}', '${user.Pr_PKGUID}'
      )
    ''';
      l_InsertionQueries.add(query); // Add the query to the list
    }

    return l_InsertionQueries;
  }
}
