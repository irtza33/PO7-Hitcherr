class SignupModel {
  static String _email = ""; //email state
  static String _password = ""; //password state
  static String _name = ""; //name state
  static String _cnic = ""; //cnic state
  static String _phone = ""; //phone state
  static bool _approved = false; //approval state
  static int _type = 0; //0 for driver, 1 for user and 2 for admin
  //getters
  static String get gemail => _email; //get email
  static String get gpassword => _password; //get password
  static String get gname => _name; //get name
  static String get gcnic => _cnic; //get cnic
  static String get gphone => _phone; //get phone number
  static int get gtype => _type; //get account type
  static bool get gapproved => _approved; //get account approval state
  //setters
  static void semail(String toSet) => _email = toSet; //set email
  static void spassword(String toSet) => _password = toSet; //set password
  static void sname(String toSet) => _name = toSet; //set name
  static void scnic(String toSet) => _cnic = toSet; //set cnic
  static void sphone(String toSet) => _phone = toSet; //set phone number
  static void stype(int toSet) => _type = toSet; //set account type
  static void sapproved(bool toSet) => _approved = toSet; //set approval state
}
