import 'package:flutter/material.dart';
import 'package:coding/Views/View.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:coding/Models/DriverSigninModel.dart';
import 'package:coding/Controllers/DriverSigninController.dart';
import 'package:coding/Views/Landing.dart';
import 'package:coding/Controllers/LandingController.dart';
import 'package:coding/Views/ApprovedLanding.dart';

class DriverSignin extends StatefulWidget {
  const DriverSignin({Key? key}) : super(key: key);
  @override
  _DriverSigninState createState() => _DriverSigninState();
}

class _DriverSigninState extends State<DriverSignin> {
  final DriverSigninController _controller = DriverSigninController();
  final LandingController _controllerL = LandingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Driver'),
        backgroundColor: Color(0xff4a44bf),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                'Welcome Back!',
                style: TextStyle(fontSize: 26),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                padding: const EdgeInsets.only(top: 50, left: 3),
                child: TextField(
                  decoration: deco('Email Address'),
                  onChanged: (value) => _controller.setEmail(value),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                padding: const EdgeInsets.only(top: 50, left: 3),
                child: TextField(
                  decoration: InputDecoration(
                      errorText: _controller.getFbErr()
                          ? _controller.getErr().toString()
                          : null,
                      fillColor: const Color.fromRGBO(50, 58, 80, 1),
                      labelText: "Password",
                      labelStyle: const TextStyle(
                          color: Color.fromRGBO(240, 238, 244, 1)),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(50, 58, 80, 1), width: 2)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(118, 146, 255, 1),
                              width: 2))),
                  obscureText: true,
                  onChanged: (value) => _controller.setPassword(value),
                  obscuringCharacter: "*",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                padding: const EdgeInsets.only(top: 40, left: 3),
                child: SizedBox(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                    child: const Text('Log In', style: TextStyle(fontSize: 16)),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      backgroundColor: Color(0xff7692ff),
                    ),
                    onPressed: () {
                      _controller.signIn().then((value) {
                        print("I AM HERE ${value}");
                        if (value != null) {
                          _controller.checkAuth().then((value) {
                            if (DriverSigninModel.checkState == 0) {
                              print("Signed in successfully");
                              _controller.setFbErr(false, null);
                              _controllerL.checkStatus().then((_) {
                                if (_controllerL.getApproval()) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              ApprovedLanding())).onError(
                                    (error, stackTrace) {
                                      print("Error ${error.toString()}");
                                    },
                                  );
                                } else {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => Landing())).onError(
                                    (error, stackTrace) {
                                      print("Error ${error.toString()}");
                                    },
                                  );
                                }
                              });
                            } else {
                              FirebaseAuth.instance.signOut();
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          "You are not registered as a Driver")));
                            }
                          });
                        } else {
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => DriverSignin())).onError(
                            (error, stackTrace) {
                              print("Error ${error.toString()}");
                            },
                          );
                        }
                      });
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

InputDecoration deco(String name) => InputDecoration(
    fillColor: const Color.fromRGBO(50, 58, 80, 1),
    labelText: name,
    labelStyle: const TextStyle(color: Color.fromRGBO(240, 238, 244, 1)),
    enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Color.fromRGBO(50, 58, 80, 1), width: 2)),
    focusedBorder: const OutlineInputBorder(
        borderSide:
            BorderSide(color: Color.fromRGBO(118, 146, 255, 1), width: 2)));
