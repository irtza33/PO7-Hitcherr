import 'package:coding/Models/LandingModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:coding/Views/View.dart';
import 'package:coding/Controllers/LandingController.dart';
import 'package:coding/Views/RideHistory.dart';

class ApprovedLanding extends StatefulWidget {
  const ApprovedLanding({Key? key}) : super(key: key);

  @override
  _ApprovedLandingState createState() => _ApprovedLandingState();
}

class _ApprovedLandingState extends State<ApprovedLanding> {
  final LandingController _controller = LandingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(top: 30),
                child: SizedBox(
                    width: 250,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        backgroundColor: Color(0xff7692ff),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => RideHistory())).onError(
                          (error, stackTrace) {
                            print("Error ${error.toString()}");
                          },
                        );
                      },
                      child: const Text('Ride History',
                          style: TextStyle(fontSize: 16)),
                    ))),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: SizedBox(
                width: 250,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    backgroundColor: Color(0xff7692ff),
                  ),
                  onPressed: () {
                    FirebaseAuth.instance.signOut().then((value) {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => View()));
                    });
                  },
                  child: const Text('Log Out', style: TextStyle(fontSize: 16)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text(_controller.getDisplay(),
                  style: TextStyle(fontSize: 16)),
            )
          ],
        )),
      ),
    );
  }
}
