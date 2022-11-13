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
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Welcome to Hitcherr'),
          centerTitle: true,
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
                    padding: const EdgeInsets.only(top: 3, left: 3),
                    child: SizedBox(
                        width: 250,
                        height: 50,
                        child: ElevatedButton(
                          child: const Text('Login as driver'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(250, 255, 0, 0),
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
                          child: const Text('Login as rider'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(250, 255, 0, 0),
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
