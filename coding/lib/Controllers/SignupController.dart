import 'package:firebase_auth/firebase_auth.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:coding/Models/SignupModel.dart';

class SignupController extends ControllerMVC {
  factory SignupController() {
    if (_this == null) _this = SignupController._();
    return _this;
  }

  static SignupController _this = SignupController._();
  SignupController._();

  String getEmail() {
    return SignupModel.gemail;
  }

  String getPassword() {
    return SignupModel.gpassword;
  }

  bool getType() {
    return SignupModel.gtype;
  }

  void setEmail(String toSet) {
    SignupModel.semail(toSet);
  }

  void setPassword(String toSet) {
    SignupModel.spassword(toSet);
  }

  void setName(String toSet) {
    SignupModel.sname(toSet);
  }

  void setCnic(String toSet) {
    SignupModel.scnic(toSet);
  }

  void setPhone(String toSet) {
    SignupModel.sphone(toSet);
  }

  void setType(bool toSet) {
    SignupModel.stype(toSet);
  }

  Future<UserCredential> signIn() {
    return FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: getEmail(), password: getPassword());
  }
}
