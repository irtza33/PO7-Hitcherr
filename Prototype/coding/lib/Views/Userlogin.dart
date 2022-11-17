import 'package:coding/Models/SignupModel.dart';
import 'package:coding/Models/UserSigninModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:coding/Views/View.dart';
import 'package:coding/Controllers/UserSigninController.dart';
import 'package:coding/Views/Landing.dart';
import 'package:coding/Controllers/LandingController.dart';
import 'package:coding/Views/ApprovedLanding.dart';

class UserSignin extends StatefulWidget {
  const UserSignin({Key? key}) : super(key: key);
  @override
  _UserSigninState createState() => _UserSigninState();
}

class _UserSigninState extends State<UserSignin> {
  //const Userlogin({Key? key}) : super(key: key);

  final UserSigninController _controller =
      UserSigninController(); //Declaring a controller for sign in
  final LandingController _controllerL =
      LandingController(); //Declaring a controller for landing/home page

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Rider'),
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
                  //Field to take input for email
                  decoration: InputDecoration(
                      fillColor: const Color.fromRGBO(50, 58, 80, 1),
                      labelText: "Email",
                      labelStyle: const TextStyle(
                          color: Color.fromRGBO(240, 238, 244, 1)),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(50, 58, 80, 1), width: 2)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(118, 146, 255, 1),
                              width: 2))),
                  onChanged: (value) => _controller.setEmail(
                      value), //Change state of model via the controller as the email is typed
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                padding: const EdgeInsets.only(top: 50, left: 3),
                child: TextField(
                  decoration: InputDecoration(
                      fillColor: const Color.fromRGBO(50, 58, 80, 1),
                      errorText: _controller.getFbErr()
                          ? _controller.getErr().toString()
                          : null,
                      labelText: "Password", //Field to take input for Password
                      labelStyle: const TextStyle(
                          color: Color.fromRGBO(240, 238, 244, 1)),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(50, 58, 80, 1), width: 2)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(118, 146, 255, 1),
                              width: 2))),
                  onChanged: (value) => _controller.setPassword(
                      value), //Changer state of model via controller
                  obscureText: true,
                  obscuringCharacter: "*", //Hide password using *
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
                      //Declare and style login button
                      child: const Text(
                        'Login',
                        style: TextStyle(fontSize: 16),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        backgroundColor: Color(0xff7692ff),
                      ),
                      onPressed: () {
                        _controller.signIn().then((value) {
                          //Pressing the login button signs in the user and returns a promise
                          //print("HERE WE ARE ${value}");
                          if (value != null) {
                            _controller.checkAuth().then((value) {
                              //controller checks whether a user is not logging into drivers login or vice versa
                              if (UserSigninModel.checkState == 1) {
                                //completelty sign in if login attempt was from user and not driver
                                print("Signed in successfully");
                                _controller.setFbErr(false,
                                    null); //The controller sets the model to no errors in sign in process

                                _controllerL.checkStatus().then((_) {
                                  //controller checks whether account is approved or not
                                  if (_controllerL.getApproval()) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                ApprovedLanding())).onError(
                                      //Navigate to home screen for approved users
                                      (error, stackTrace) {
                                        print("Error ${error.toString()}");
                                      },
                                    );
                                  } else {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => Landing())).onError(
                                      //Navigate to home screen for pending approval users
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
                                            "You are not registered as a customer"))); //If a driver tries to log in to user login
                              }
                            });
                          } else {
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => UserSignin())).onError(
                              //Refresh page upon error to try again
                              (error, stackTrace) {
                                print("Error ${error.toString()}");
                              },
                            );
                          }
                        });
                      }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
