class UserSigninModel {
  static String _email = "";
  static String _password = "";

  static int checkState = 0;

  static String get getEmail => _email;
  static String get getPassword => _password;

  static void setEmail(String toSet) {
    _email = toSet;
  }

  static void setPassword(String toSet) {
    _password = toSet;
  }
}
