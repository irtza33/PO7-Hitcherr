import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:coding/Models/DriverSigninModel.dart';

class DriverSigninController extends ControllerMVC {
  factory DriverSigninController() {
    if (_this == null) _this = DriverSigninController._();
    return _this;
  }

  static DriverSigninController _this = DriverSigninController._();
  DriverSigninController._();

  void setEmail(String toSet) {
    DriverSigninModel.setEmail(toSet);
  }

  void setPassword(String toSet) {
    DriverSigninModel.setPassword(toSet);
  }

  void setFbErr(bool toSet, Object? err) {
    DriverSigninModel.setFbErr(toSet, err);
  }

  bool getFbErr() {
    return DriverSigninModel.getFbErr;
  }

  Object? getErr() {
    return DriverSigninModel.getErr;
  }

  Future signIn() async {
    print(DriverSigninModel.getEmail);
    print(DriverSigninModel.getPassword);
    try {
      return await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: DriverSigninModel.getEmail,
          password: DriverSigninModel.getPassword);
    } on FirebaseAuthException catch (err) {
      DriverSigninModel.setFbErr(true, err.toString());
    }
    // return FirebaseAuth.instance.signInWithEmailAndPassword(
    //     email: UserSigninModel.getEmail, password: UserSigninModel.getPassword);
  }

  Future checkAuth() async {
    final CollectionReference users =
        FirebaseFirestore.instance.collection('users');
    try {
      var res = await users
          .where('email', isEqualTo: DriverSigninModel.getEmail)
          .get();

      if (res.docs.length > 0) {
        DriverSigninModel.checkState = res.docs[0]['type'];
      }
    } on FirebaseException catch (err) {
      print(err);
    } catch (err) {
      print(err.toString());
      return null;
    }
  }
}
