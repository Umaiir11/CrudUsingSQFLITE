import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqfliteflutterdb/DAL/DAL.dart';
import 'package:sqfliteflutterdb/MVVM/Model/DB/ModUserDB.dart';
import 'package:tuple/tuple.dart';
import '../../Validation/DVMUser.dart';
import '../../cmMod/DbHelperClass.dart';
import '../ViewModel/VmUserData.dart';

class VwUserData extends StatefulWidget {
  const VwUserData({Key? key}) : super(key: key);

  @override
  State<VwUserData> createState() => _VwUserDataState();
}

class _VwUserDataState extends State<VwUserData> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final VmUserData l_VmUserData = Get.put(VmUserData());

  @override
  void initState() {
    // TODO: implement initState
    //DBHelper().FncCreateDataBase();
    DBHelper().FncCreateDataBase();
    super.initState();
  }

  //final DBHelper l_DBHelper = Get.put(DBHelper());
  ModUserDB l_ModUserDB = ModUserDB();

  final TextEditingController l_Pr_FnameController = TextEditingController();
  final TextEditingController l_Pr_LnameController = TextEditingController();
  final TextEditingController l_Pr_EmailIDController = TextEditingController();
  final TextEditingController l_Pr_CompanyIDController = TextEditingController();
  final TextEditingController l_Pr_AddressController = TextEditingController();
  final TextEditingController l_Pr_Operation = TextEditingController();

  @override
  Widget build(BuildContext context) {
    l_Pr_FnameController.text = l_VmUserData.Pr_txtFname_Text;
    l_Pr_LnameController.text = l_VmUserData.Pr_txtLname_Text;
    l_Pr_EmailIDController.text = l_VmUserData.Pr_txtEmailID_Text;
    l_Pr_CompanyIDController.text = l_VmUserData.Pr_txtCompanyID_Text;
    l_Pr_AddressController.text = l_VmUserData.Pr_txtAddress_Text;
    Widget _WidgetportraitMode(double PrHeight, PrWidth) {
      return Scaffold(
        body: Form(
          key: _formKey,
          child: Container(
            height: PrHeight,
            width: PrWidth,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFFFFFFF),
                  Color(0xFFFFFFFF),
                  Color(0xFFFFFFFF),
                  Color(0xFFFFFFFF),
                ],
                stops: [0.1, 0.5, 0.7, 0.9],
              ),
            ),
            //color: Colors.black,
            padding: const EdgeInsets.all(16.0),
            // we use child container property and used most important property column that accepts multiple widgets

            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      top: PrHeight * 0.15,
                      right: PrWidth * 0.25,
                    ),
                    child: Text(
                      "Please enter your information",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: PrHeight * 0.010),
                    child: Center(
                      child: SizedBox(
                          width: PrWidth * .890,
                          child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: l_Pr_Operation,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[100],
                                hintText: 'Operation',
                                hintStyle: const TextStyle(color: Colors.black38),
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide.none),
                              ),
                              validator: (value) {
                                int? parsedValue = int.tryParse(value ?? '');
                                l_ModUserDB.Pr_Operation = parsedValue;

                                Tuple2<List<String>?, List<String>?> errors = DVMUser.Fnc_Validate(l_ModUserDB);
                                if (errors.item2 != null && errors.item2!.contains('Pr_Operation')) {
                                  return errors.item1![errors.item2!.indexOf('Pr_Operation')]; // Return the error message for Pr_EmailID
                                }

                                return null;
                              },
                              onChanged: (value) {
                                int parsedValue = int.tryParse(value) ?? 0;
                                l_VmUserData.Pr_txtOperation_Text = parsedValue;                              })),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: PrHeight * 0.02),
                    child: Center(
                      child: SizedBox(
                        width: PrWidth * .890,
                        child: TextFormField(
                            controller: l_Pr_FnameController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[100],
                              hintText: ' First name',
                              hintStyle: const TextStyle(color: Colors.black38),
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide.none),
                            ),
                            validator: (value) {
                              l_ModUserDB.Pr_Fname = value ?? '';
                              Tuple2<List<String>?, List<String>?> errors = DVMUser.Fnc_Validate(l_ModUserDB);
                              if (errors.item2 != null && errors.item2!.contains('Pr_Fname')) {
                                return errors.item1![errors.item2!.indexOf('Pr_Fname')];
                              }

                              return null;
                            },
                            onChanged: (value) {
                              l_VmUserData.Pr_txtFname_Text = value;
                            }),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: PrHeight * 0.02),
                    child: Center(
                      child: SizedBox(
                          width: PrWidth * .890,
                          child: TextFormField(
                              controller: l_Pr_LnameController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[100],
                                hintText: 'Last name',
                                hintStyle: const TextStyle(color: Colors.black38),
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide.none),
                              ),
                              validator: (value) {
                                l_ModUserDB.Pr_Lname = value ?? '';
                                Tuple2<List<String>?, List<String>?> errors = DVMUser.Fnc_Validate(l_ModUserDB);
                                if (errors.item2 != null && errors.item2!.contains('Pr_Lname')) {
                                  return errors
                                      .item1![errors.item2!.indexOf('Pr_Lname')]; // Return the error message for Pr_FullName
                                }

                                return null;
                              },
                              onChanged: (value) {
                                l_VmUserData.Pr_txtLname_Text = value;
                              })),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: PrHeight * 0.02),
                    child: Center(
                      child: SizedBox(
                          width: PrWidth * .890,
                          child: TextFormField(
                              controller: l_Pr_EmailIDController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[100],
                                hintText: 'Email ID',
                                hintStyle: const TextStyle(color: Colors.black38),
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide.none),
                              ),
                              validator: (value) {
                                l_ModUserDB.Pr_EmailID = value ?? '';
                                Tuple2<List<String>?, List<String>?> errors = DVMUser.Fnc_Validate(l_ModUserDB);
                                if (errors.item2 != null && errors.item2!.contains('Pr_EmailID')) {
                                  return errors
                                      .item1![errors.item2!.indexOf('Pr_EmailID')]; // Return the error message for Pr_EmailID
                                }

                                return null;
                              },
                              onChanged: (value) {
                                l_VmUserData.Pr_txtEmailID_Text = value;
                              })),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: PrHeight * 0.02),
                    child: Center(
                      child: SizedBox(
                          width: PrWidth * .890,
                          child: TextFormField(
                              controller: l_Pr_CompanyIDController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[100],
                                hintText: 'Company ID',
                                hintStyle: const TextStyle(color: Colors.black38),
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide.none),
                              ),
                              validator: (value) {
                                l_ModUserDB.Pr_CompanyID = value ?? '';
                                Tuple2<List<String>?, List<String>?> errors = DVMUser.Fnc_Validate(l_ModUserDB);
                                if (errors.item2 != null && errors.item2!.contains('Pr_CompanyID')) {
                                  return errors
                                      .item1![errors.item2!.indexOf('Pr_CompanyID')]; // Return the error message for Pr_EmailID
                                }

                                return null;
                              },
                              onChanged: (value) {
                                l_VmUserData.Pr_txtCompanyID_Text = value;
                              })),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: PrHeight * 0.01),
                    child: Center(
                      child: SizedBox(
                          width: 400,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5), // <-- Radius
                                ),
                                backgroundColor: Colors.cyan),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                l_VmUserData.FncFillModel();
                                l_Pr_FnameController.clear();
                                l_Pr_LnameController.clear();
                                l_Pr_EmailIDController.clear();
                                l_Pr_CompanyIDController.clear();
                                l_Pr_Operation.clear();
                              } else {
                                l_VmUserData.l_autoValidate.value = true;
                              }
                            },
                            child: Text(
                              "Add",
                            ),
                          )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: PrHeight * 0.01),
                    child: Center(
                      child: SizedBox(
                          width: 400,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5), // <-- Radius
                                ),
                                backgroundColor: Colors.cyan),
                            onPressed: () async {
                              if (l_VmUserData.lModUserDBList.isNotEmpty) {
                                DAL().Fnc_CudUser(l_VmUserData.lModUserDBList);

                              }
                            },
                            child: Text(
                              "Save to DB",
                            ),
                          )),
                    ),
                  ),   Padding(
                    padding: EdgeInsets.only(top: PrHeight * 0.01),
                    child: Center(
                      child: SizedBox(
                          width: 400,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5), // <-- Radius
                                ),
                                backgroundColor: Colors.cyan),
                            onPressed: () async {


                              },
                            child: Text(
                              "DBcheck",
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        //when tap anywhere on screen keyboard dismiss
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          return LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              //Get device's screen height and width.
              double height = constraints.maxHeight;
              double width = constraints.maxWidth;

              if (width >= 300 && width < 500) {
                return _WidgetportraitMode(height, width);
              } else {
                return _WidgetportraitMode(height, width);
              }
            },
          );
        },
      ),
    );
  }
}
