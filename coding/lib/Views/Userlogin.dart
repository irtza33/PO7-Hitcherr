import 'package:coding/Models/SignupModel.dart';
import 'package:coding/Models/UserSigninModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:coding/Views/View.dart';
import 'package:coding/Controllers/UserSigninController.dart';
import 'package:coding/Views/Landing.dart';

class UserSignin extends StatefulWidget {
  const UserSignin({Key? key}) : super(key: key);
  @override
  _UserSigninState createState() => _UserSigninState();
}

class _UserSigninState extends State<UserSignin> {
  //const Userlogin({Key? key}) : super(key: key);

  final UserSigninController _controller = UserSigninController();

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
                      fillColor: const Color.fromRGBO(50, 58, 80, 1),
                      errorText: _controller.getFbErr()
                          ? _controller.getErr().toString()
                          : null,
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
                  onChanged: (value) => _controller.setPassword(value),
                  obscureText: true,
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
                          //print("HERE WE ARE ${value}");
                          if (value != null) {
                            _controller.checkAuth().then((value) {
                              if (UserSigninModel.checkState == 1) {
                                print("Signed in successfully");
                                _controller.setFbErr(false, null);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => Landing())).onError(
                                  (error, stackTrace) {
                                    print("Error ${error.toString()}");
                                  },
                                );
                              } else {
                                FirebaseAuth.instance.signOut();
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            "You are not registered as a customer")));
                              }
                            });
                          } else {
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => UserSignin())).onError(
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
