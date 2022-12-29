import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:coding/Models/DriverSigninModel.dart';

class DriverSigninController extends ControllerMVC {
  factory DriverSigninController() {
    if (_this == null) _this = DriverSigninController._();
    return _this;
  }

  static DriverSigninController _this =
      DriverSigninController._(); //initialise controller
  DriverSigninController._();

  void setEmail(String toSet) {
    DriverSigninModel.setEmail(toSet); //set email to model
  }

  void setPassword(String toSet) {
    DriverSigninModel.setPassword(toSet); //set password to model
  }

  void setFbErr(bool toSet, Object? err) {
    DriverSigninModel.setFbErr(
        toSet, err); //set error state and error message to model
  }

  bool getFbErr() {
    return DriverSigninModel.getFbErr; //get error state from model
  }

  Object? getErr() {
    return DriverSigninModel.getErr; //get error message
  }

  Future signIn() async {
    // print(DriverSigninModel.getEmail);
    // print(DriverSigninModel.getPassword);
    try {
      return await FirebaseAuth.instance.signInWithEmailAndPassword(
          //Sign in user using firebase auth
          email: DriverSigninModel.getEmail,
          password: DriverSigninModel.getPassword);
    } on FirebaseAuthException catch (err) {
      DriverSigninModel.setFbErr(true, err.toString());
    }
  }

  Future checkAuth() async {
    //check whether driving is signing in or some other user
    final CollectionReference users = FirebaseFirestore.instance
        .collection('users'); //access user collection data from firestore
    try {
      var res = await users
          .where('email',
              isEqualTo: DriverSigninModel
                  .getEmail) //filter data based on current user's email
          .get();

      if (res.docs.length > 0) {
        DriverSigninModel.checkState = res.docs[0][
            'type']; //access type field from result extracted and set state to model
      }
    } on FirebaseException catch (err) {
      print(err);
    } catch (err) {
      print(err.toString());
      return null;
    }
  }
}
