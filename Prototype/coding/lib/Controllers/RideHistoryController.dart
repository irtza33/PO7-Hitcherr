import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:coding/Models/RideHistoryModel.dart';

class RideHistoryController extends ControllerMVC {
  factory RideHistoryController() {
    if (_this == null) _this = RideHistoryController._();
    return _this;
  }

  static RideHistoryController _this =
      RideHistoryController._(); //Initialise controller
  RideHistoryController._();

  int getFare() {
    return RideHistoryModel.gfare; //get fare from model
  }

  int getRating() {
    return RideHistoryModel.grating; //get rating from model
  }

  void setFare(int toSet) {
    RideHistoryModel.sfare(toSet); //set fare to model
  }

  void setRating(int toSet) {
    RideHistoryModel.srating(toSet); //set rating to model
  }

  Future renderHistory() async {
    return FirebaseFirestore.instance
        .collection('rides'); //access rides date from firestore
  }
}
