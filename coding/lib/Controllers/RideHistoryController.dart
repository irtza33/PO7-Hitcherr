import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:coding/Models/RideHistoryModel.dart';

class RideHistoryController extends ControllerMVC {
  factory RideHistoryController() {
    if (_this == null) _this = RideHistoryController._();
    return _this;
  }

  static RideHistoryController _this = RideHistoryController._();
  RideHistoryController._();

  int getFare() {
    return RideHistoryModel.gfare;
  }

  int getRating() {
    return RideHistoryModel.grating;
  }

  void setFare(int toSet) {
    RideHistoryModel.sfare(toSet);
  }

  void setRating(int toSet) {
    RideHistoryModel.srating(toSet);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseFirestore.instance.collection('rides').snapshots();
  }

  Future renderHistory() async {
    return FirebaseFirestore.instance.collection('rides');
    // try {
    //   var currentUser = FirebaseAuth.instance.currentUser;
    //   if (currentUser != null) {
    //     var res =
    //         await users.where('email', isEqualTo: currentUser.email).get();

    //     if (res.docs.length > 0) {
    //       //DriverSigninModel.checkState = res.docs[0]['type'];
    //       //print(res.docs[0]['fare']);
    //       return res.docs;
    //     }
    //   }
    // } on FirebaseException catch (err) {
    //   print(err);
    // } catch (err) {
    //   print(err.toString());
    //   return null;
    // }
  }
}
