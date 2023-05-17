import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

import '../MVVM/Model/DB/ModUserDB.dart';
import '../cmMod/DbHelperClass.dart';

class DAL extends GetxController {

  Fnc_CudUser(List<ModUserDB> l_UserList) async {
    Database? l_Database = await DBHelper().FncGetDatabase();
    List<String?> l_InsertionQuery = await FncGenQueries(l_UserList);
    final batch = l_Database!.batch();
    int index = 0;

    for (var user in l_UserList){
      final values = [
        user.Pr_Fname,
        user.Pr_Lname,
        user.Pr_EmailID,
        user.Pr_CompanyID,
        user.Pr_Address,
        user.Pr_PKGUID,
      ];
      final query = l_InsertionQuery[index];
      batch.execute(query!, values);
      index++;
    }

    await batch.commit();
  }

  Future<List<String>> FncGenQueries(List<ModUserDB> l_UserList) async {
    List<String> l_InsertionQueries = [];

    for (var user in l_UserList) {
      final query = '''
      INSERT INTO Users (
        Fname, Lname, EmailID, CompanyID, Address, PKGUID
      ) VALUES (?, ?, ?, ?, ?, ?)
    ''';
      l_InsertionQueries.add(query); // Add the query to the list
    }

    return l_InsertionQueries;
  }
}
