class ModUserDB {
  String? Pr_Fname;
  String? Pr_Lname;
  String? Pr_EmailID;
  String? Pr_CompanyID;
  String? Pr_Address;
  String? Pr_PKGUID;

  Map<String, dynamic> UserToJson() {
    final jsonMap = <String, dynamic>{};
    if (Pr_Fname != null) jsonMap["Pr_Fname"] = Pr_Fname!;
    if (Pr_Lname != null) jsonMap["Pr_Lname"] = Pr_Lname!;
    if (Pr_EmailID != null) jsonMap["Pr_EmailID"] = Pr_EmailID!;
    if (Pr_CompanyID != null) jsonMap["Pr_CompanyID"] = Pr_CompanyID!;
    if (Pr_Address != null) jsonMap["Pr_Address"] = Pr_Address!;
    if (Pr_PKGUID != null) jsonMap["Pr_PKGUID"] = Pr_PKGUID!;
    return jsonMap;
  }
}
