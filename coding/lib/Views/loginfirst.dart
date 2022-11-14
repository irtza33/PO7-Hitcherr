import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:coding/Controllers/Controller.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:coding/Views/Driverlogin.dart';
import 'package:coding/Views/Userlogin.dart';

class loginfirst extends StatelessWidget {
  const loginfirst({super.key});

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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => Driverlogin()));
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => UserSignin()));
                          },
                        ))),
              ),
            ],
          ),
        ));
  }
}
