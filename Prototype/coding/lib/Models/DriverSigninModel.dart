import 'package:firebase_auth/firebase_auth.dart';

class DriverSigninModel {
  static String _email = "";
  static String _password = "";
  static bool _fbErr = false;
  static Object? _err = null;

  static int checkState = 0;

  static String get getEmail => _email;
  static String get getPassword => _password;
  static bool get getFbErr => _fbErr;
  static Object? get getErr => _err;

  static void setFbErr(bool toSet, Object? err) {
    _fbErr = toSet;
    if (err.toString().contains("wrong-password")) {
      _err = "You entered an incorrect password";
    } else {
      _err = err;
    }
  }

  static void setEmail(String toSet) {
    _email = toSet;
  }

  static void setPassword(String toSet) {
    _password = toSet;
  }
}
