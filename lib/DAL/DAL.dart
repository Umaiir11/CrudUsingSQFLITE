import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqfliteflutterdb/MVVM/Model/DB/ModUserDB.dart';
import 'package:sqfliteflutterdb/QueryGen/QueryGen.dart';

import '../cmMod/DbHelperClass.dart';

class DAL extends GetxController {
  Fnc_CudUser(List<ModUserDB> l_UserList) async {
    Database? l_Database = await DBHelper().FncGetDatabaseIns();
    List<String> l_InsertionQuery = await QueryGen().FncGenCrudQueries(l_UserList);

    final batch = l_Database!.batch();
    for (int indexoflist = 0; indexoflist < l_InsertionQuery.length; indexoflist++) {
      final query = l_InsertionQuery[indexoflist];
      batch.execute(query);
    }
    await batch.commit();

    // Clear the list after the data is stored on the database.
    l_UserList.clear();
  }

}
