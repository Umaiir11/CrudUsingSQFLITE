import 'package:tuple/tuple.dart';

import '../MVVM/Model/DB/ModUserDB.dart';

class DVMUser {
  static Tuple2<List<String>?, List<String>?> Fnc_Validate(ModUserDB lModUserDB) {
    List<String>? lErrorMsgs = [];
    List<String>? lFieldNames = [];

    if (lModUserDB.Pr_Fname?.isEmpty ?? true) {
      lErrorMsgs.add('Please enter your first name.');
      lFieldNames.add('Pr_Fname');
    }
    if (lModUserDB.Pr_Lname?.isEmpty ?? true) {
      lErrorMsgs.add('Please enter your last name.');
      lFieldNames.add('Pr_Lname');
    }

    if (lModUserDB.Pr_EmailID?.isEmpty ?? true ) {
      lErrorMsgs.add('Please enter your email id.');
      lFieldNames.add('Pr_EmailID');
    } else {
      bool lIsEmailValid = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(lModUserDB.Pr_EmailID!);
      if (!lIsEmailValid) {
        lErrorMsgs.add('Please enter a valid email id.');
        lFieldNames.add('Pr_EmailID');
      }
    }

    if (lModUserDB.Pr_CompanyID?.isEmpty ?? true) {
      lErrorMsgs.add('Please enter your company ID.');
      lFieldNames.add('Pr_CompanyID');
    }
    if (lModUserDB.Pr_Address?.isEmpty ?? true) {
      lErrorMsgs.add('Please enter your address.');
      lFieldNames.add('Pr_Address');
    }

    // Add more field validation here as needed

    if (lErrorMsgs.isNotEmpty || lFieldNames.isNotEmpty) {
      return Tuple2(lErrorMsgs, lFieldNames);
    }

    return const Tuple2(null, null);
  }
}
