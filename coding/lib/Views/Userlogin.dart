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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 150, 0, 0),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                padding: const EdgeInsets.only(top: 50, left: 3),
                child: TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Email Address'),
                  onChanged: (value) => _controller.setEmail(value),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                padding: const EdgeInsets.only(top: 50, left: 3),
                child: TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Password'),
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
                      child: const Text('Login as Rider'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(250, 255, 0, 0),
                      ),
                      onPressed: () {
                        _controller.signIn().then(
                          (value) {
                            if (value != null) {
                              _controller.checkAuth().then((value) {
                                if (UserSigninModel.checkState == 1) {
                                  print("Signed in successfully");
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
                            }
                          },
                        );
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
