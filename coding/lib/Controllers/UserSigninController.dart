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

  Future<UserCredential> signIn() {
    return FirebaseAuth.instance.signInWithEmailAndPassword(
        email: UserSigninModel.getEmail, password: UserSigninModel.getPassword);
  }

  Future checkAuth() async {
    final CollectionReference users =
        FirebaseFirestore.instance.collection('users');
    try {
      var res =
          await users.where('email', isEqualTo: UserSigninModel.getEmail).get();

      if (res.docs.length > 0) {
        UserSigninModel.checkState = res.docs[0]['type'];
      }
    } on FirebaseException catch (err) {
      print(err);
    } catch (err) {
      print(err.toString());
      return null;
    }
  }
}
