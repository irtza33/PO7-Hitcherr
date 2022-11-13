import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:coding/Views/View.dart';

class Landing extends StatefulWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
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
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SizedBox(
                width: 250,
                height: 50,
                child: ElevatedButton(
                  child: const Text('Log Out'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(250, 255, 0, 0),
                  ),
                  onPressed: () {
                    FirebaseAuth.instance.signOut().then((value) {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => View()));
                    });
                  },
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
