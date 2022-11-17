import 'package:cloud_firestore/cloud_firestore.dart';
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

  int getType() {
    return SignupModel.gtype;
  }

  bool getApproved() {
    return SignupModel.gapproved;
  }

  void setApproved(bool toSet) {
    SignupModel.sapproved(toSet);
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

  void setType(int toSet) {
    SignupModel.stype(toSet);
  }

  Future signUp() {
    return FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: getEmail(), password: getPassword());
  }

  void updateDB(User user) async {
    //temporary before setting up proper system
    SignupModel.gtype == 1
        ? SignupModel.sapproved(true)
        : SignupModel.sapproved(false);
    FirebaseFirestore.instance.collection("users").doc(user.uid).set(
      {
        'name': SignupModel.gname,
        'email': SignupModel.gemail,
        'password': SignupModel.gpassword,
        'phone': SignupModel.gphone,
        'cnic': SignupModel.gcnic,
        'type': SignupModel.gtype,
        'approved': SignupModel.gapproved,
      },
    );
  }
}
