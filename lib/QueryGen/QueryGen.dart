import 'package:sqfliteflutterdb/MVVM/Model/DB/ModUserDB.dart';

class QueryGen{

  Future<List<String>> FncGenCrudQueries(List<ModUserDB> l_UserList) async {
    List<String> l_Queries = [];

    for (ModUserDB l_ModUserDB in l_UserList) {
      if (l_ModUserDB.Pr_Operation == 1) {
        final query = '''
        INSERT INTO Users (
          Fname, Lname, EmailID, CompanyID, Operation, PKGUID
        ) VALUES (
          '${l_ModUserDB.Pr_Fname}', '${l_ModUserDB.Pr_Lname}', '${l_ModUserDB.Pr_EmailID}', 
          '${l_ModUserDB.Pr_CompanyID}', '${l_ModUserDB.Pr_Operation}', '${l_ModUserDB.Pr_PKGUID}'
        )
      ''';
        l_Queries.add(query);
      } else if (l_ModUserDB.Pr_Operation == 2) {
        final query = '''
        UPDATE Users SET
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
        DELETE FROM Users
        WHERE Fname = '${l_ModUserDB.Pr_Fname}'
          AND Lname = '${l_ModUserDB.Pr_Lname}'
      ''';
        l_Queries.add(query);
      }
    }

    return l_Queries;
  }


}