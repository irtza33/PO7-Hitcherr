import 'package:coding/Models/LandingModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:coding/Views/View.dart';
import 'package:coding/Controllers/LandingController.dart';

class Landing extends StatefulWidget {
  //This View is for unapproved users
  const Landing({Key? key}) : super(key: key);

  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
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
                      //Sign out user upon pressing logout
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => View())); //Navigate to View Page
                    });
                  },
                  child: const Text('Log Out', style: TextStyle(fontSize: 16)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text(_controller.getDisplay(), //Fetch error message
                  style: TextStyle(fontSize: 16)),
            )
          ],
        )),
      ),
    );
  }
}
