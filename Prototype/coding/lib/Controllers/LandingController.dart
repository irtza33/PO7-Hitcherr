import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:coding/Models/UserSigninModel.dart';
import 'package:coding/Models/LandingModel.dart';

class LandingController extends ControllerMVC {
  factory LandingController() {
    if (_this == null) _this = LandingController._();
    return _this;
  }

  static LandingController _this =
      LandingController._(); //initialsie controller
  LandingController._();

  String getDisplay() {
    //print("HELLO${LandingModel.gdisplay}");
    return LandingModel.gdisplay; //return display state from model
  }

  bool getApproval() {
    return LandingModel.gapproved; //return approval state from model
  }

  Future checkStatus() async {
    final CollectionReference users = FirebaseFirestore.instance
        .collection('users'); //extract user data from firestore
    try {
      var currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        var res = await users
            .where('email', isEqualTo: currentUser.email)
            .get(); //filter data based on current user's email

        if (res.docs.length > 0) {
          //print("FOUND IT ${res.docs[0]['approved']}");
          LandingModel.sapproved(
              res.docs[0]['approved']); //filter data based on approved field
        }
        if (LandingModel.gapproved) {
          LandingModel.sdisplay(""); //display nothing if account is approved
        } else {
          LandingModel.sdisplay(
              "Your account is pending approval"); //display message if account is pending approval
        }
      }
    } on FirebaseException catch (err) {
      print(err);
    } catch (err) {
      print(err.toString());
    }
  }
}
