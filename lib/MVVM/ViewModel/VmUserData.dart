import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:uuid/uuid.dart';

import '../Model/DB/ModUserDB.dart';

class VmUserData extends GetxController{

  List<ModUserDB> DB_DataList = [];
  RxBool l_autoValidate = false.obs;

  void FncClearFeilds() {
    Pr_txtAddress_Text = '';
    Pr_txtFname_Text = '';
    Pr_txtLname_Text = '';
    Pr_txtEmailID_Text = '';
    Pr_txtCompanyID_Text = '';
  }


  RxString l_PrFName = ''.obs;

  String get Pr_txtFname_Text {
    return l_PrFName.value;
  }

  set Pr_txtFname_Text(String value) {
    l_PrFName.value = value;
  }

  RxString l_PrLName = ''.obs;

  String get Pr_txtLname_Text {
    return l_PrLName.value;
  }

  set Pr_txtLname_Text(String value) {
    l_PrLName.value = value;
  }


  RxString l_PrEmailID = ''.obs;

  String get Pr_txtEmailID_Text {
    return l_PrEmailID.value;
  }

  set Pr_txtEmailID_Text(String value) {
    l_PrEmailID.value = value;
  }

  RxString l_PrCompanyID = ''.obs;

  String get Pr_txtCompanyID_Text {
    return l_PrCompanyID.value;
  }

  set Pr_txtCompanyID_Text(String value) {
    l_PrCompanyID.value = value;
  }

  RxString l_PrAddress = ''.obs;

  String get Pr_txtAddress_Text {
    return l_PrAddress.value;
  }

  set Pr_txtAddress_Text(String value) {
    l_PrAddress.value = value;
  }

  List<ModUserDB> lModUserDBList = [];
  FncFillModel() {

    String uuid = const Uuid().v4();

    ModUserDB lModUserDB = ModUserDB();
    lModUserDB.Pr_PKGUID = uuid;
    lModUserDB.Pr_Fname = Pr_txtFname_Text;
    lModUserDB.Pr_Lname = Pr_txtLname_Text;
    lModUserDB.Pr_EmailID = Pr_txtEmailID_Text;
    lModUserDB.Pr_CompanyID = Pr_txtCompanyID_Text;
    lModUserDB.Pr_Address = Pr_txtAddress_Text;
    lModUserDBList.add(lModUserDB);


    }

  }

