import 'package:firebase_auth/firebase_auth.dart';

class UserSigninModel {
  static String _email = ""; //email state
  static String _password = ""; //password state
  static bool _fbErr = false; //error state
  static Object? _err = null; //error message

  static int checkState = 0;

  static String get getEmail => _email; //get email
  static String get getPassword => _password; //get password
  static bool get getFbErr => _fbErr; //get error state
  static Object? get getErr => _err; //get erroe message

  static void setFbErr(bool toSet, Object? err) {
    _fbErr = toSet;
    if (err.toString().contains("wrong-password")) {
      //set error message
      _err = "You entered an incorrect password";
    } else {
      _err = err;
    }
  }

  static void setEmail(String toSet) {
    //set email
    _email = toSet;
  }

  static void setPassword(String toSet) {
    //set password
    _password = toSet;
  }
}
