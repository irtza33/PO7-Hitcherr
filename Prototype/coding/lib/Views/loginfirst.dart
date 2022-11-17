import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:coding/Views/Driverlogin.dart';
import 'package:coding/Views/Userlogin.dart';
import 'package:coding/Controllers/UserSigninController.dart';
import 'package:coding/Controllers/DriverSigninController.dart';

class loginfirst extends StatefulWidget {
  const loginfirst({Key? key}) : super(key: key);
  @override
  _loginfirst createState() => _loginfirst();
}

class _loginfirst extends State<loginfirst> {
  //const loginfirst({super.key});
  final UserSigninController _controllerU =
      UserSigninController(); //initialise sign in controller for user
  final DriverSigninController _controllerD =
      DriverSigninController(); //Initialise sign in controller for driver

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Account Type'),
          centerTitle: true,
          backgroundColor: Color(0xff4a44bf),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 50),
                child: Center(
                  child: Text(
                    'Log In',
                    style: TextStyle(fontSize: 26),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                    padding: const EdgeInsets.only(top: 3, left: 3),
                    child: SizedBox(
                        width: 250,
                        height: 50,
                        child: ElevatedButton(
                          child: const Text('Driver',
                              style: TextStyle(fontSize: 18)),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            backgroundColor: Color(0xff7692ff),
                          ),
                          onPressed: () {
                            _controllerD.setFbErr(
                                false, null); //refresh error state
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) =>
                                        DriverSignin())); //Navigate to driver sign in page
                          },
                        ))),
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                    padding: const EdgeInsets.only(top: 3, left: 3),
                    child: SizedBox(
                        width: 250, // <-- Your width
                        height: 50, // <-- Your height
                        child: ElevatedButton(
                          child: const Text('Rider',
                              style: TextStyle(fontSize: 18)),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            backgroundColor: Color(0xff7692ff),
                          ),
                          onPressed: () {
                            _controllerU.setFbErr(
                                false, null); //Set error state for user
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) =>
                                        UserSignin())); //Navigate to user sign in page
                          },
                        ))),
              ),
            ],
          ),
        ));
  }
}
