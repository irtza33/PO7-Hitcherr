import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:coding/Models/SignupModel.dart';

class SignupController extends ControllerMVC {
  factory SignupController() {
    if (_this == null) _this = SignupController._();
    return _this;
  }

  static SignupController _this =
      SignupController._(); //initialise controller class
  SignupController._();

  String getEmail() {
    return SignupModel.gemail; //return email from model
  }

  String getPassword() {
    return SignupModel.gpassword; //return password from model
  }

  int getType() {
    return SignupModel.gtype; //return account type from model
  }

  bool getApproved() {
    return SignupModel.gapproved; //return approved state from model
  }

  void setApproved(bool toSet) {
    SignupModel.sapproved(toSet); //set approved state to model
  }

  void setEmail(String toSet) {
    SignupModel.semail(toSet); //set email to model
  }

  void setPassword(String toSet) {
    SignupModel.spassword(toSet); //set password to model
  }

  void setName(String toSet) {
    SignupModel.sname(toSet); //set name to model
  }

  void setCnic(String toSet) {
    SignupModel.scnic(toSet); //set cnic to model
  }

  void setPhone(String toSet) {
    SignupModel.sphone(toSet); //set phone number to model
  }

  void setType(int toSet) {
    SignupModel.stype(toSet); //set account type to model
  }

  Future signUp() {
    return FirebaseAuth.instance.createUserWithEmailAndPassword(
        //create new account in firebase
        email: getEmail(),
        password: getPassword());
  }

  void updateDB(User user) async {
    //Update firestore with new account
    //temporary before setting up proper system
    SignupModel.gtype == 1
        ? SignupModel.sapproved(
            true) //Set customer's account to approved by default
        : SignupModel.sapproved(
            false); //Set driver's account to unapproved by default
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
