import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:coding/Models/UserSigninModel.dart';
import 'package:coding/Models/SignupModel.dart';

class UserSigninController extends ControllerMVC {
  factory UserSigninController() {
    if (_this == null) _this = UserSigninController._();
    return _this;
  }

  static UserSigninController _this = UserSigninController._();
  UserSigninController._();

  void setEmail(String toSet) {
    UserSigninModel.setEmail(toSet);
  }

  void setPassword(String toSet) {
    UserSigninModel.setPassword(toSet);
  }

  void setFbErr(bool toSet, Object? err) {
    UserSigninModel.setFbErr(toSet, err);
  }

  bool getFbErr() {
    return UserSigninModel.getFbErr;
  }

  Object? getErr() {
    return UserSigninModel.getErr;
  }

  Future signIn() async {
    try {
      return await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: UserSigninModel.getEmail,
          password:
              UserSigninModel.getPassword); //Sign in using email and password
    } on FirebaseAuthException catch (err) {
      UserSigninModel.setFbErr(true,
          err.toString()); //Turn error state to true upon exception thrown by firebase
    }
  }

  Future checkAuth() async {
    final CollectionReference users = FirebaseFirestore.instance
        .collection('users'); //Extract data from collection
    try {
      var res = await users
          .where('email', isEqualTo: UserSigninModel.getEmail)
          .get(); //Filter out data with only the signed in user's email

      if (res.docs.length > 0) {
        UserSigninModel.checkState = res.docs[0]
            ['type']; //Extract type of user's account and update model state
      }
    } on FirebaseException catch (err) {
      print(err); //catch firebase exceptions
    } catch (err) {
      print(err.toString()); //catch regular errors
      return null;
    }
  }
}
