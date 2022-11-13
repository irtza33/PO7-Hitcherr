class SignupModel {
  static String _email = "";
  static String _password = "";
  static String _name = "";
  static String _cnic = "";
  static String _phone = "";
  static bool _type = false; //false for driver
  //getters
  static String get gemail => _email;
  static String get gpassword => _password;
  static String get gname => _name;
  static String get gcnic => _cnic;
  static String get gphone => _phone;
  static bool get gtype => _type;
  //setters
  static void semail(String toSet) => _email = toSet;
  static void spassword(String toSet) => _password = toSet;
  static void sname(String toSet) => _name = toSet;
  static void scnic(String toSet) => _cnic = toSet;
  static void sphone(String toSet) => _phone = toSet;
  static void stype(bool toSet) => _type = toSet;
}
