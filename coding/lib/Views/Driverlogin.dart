import 'package:flutter/material.dart';
import 'package:coding/Views/View.dart';

class Driverlogin extends StatelessWidget {
  const Driverlogin({Key? key}) : super(key: key);

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
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                padding: const EdgeInsets.only(top: 50, left: 3),
                child: TextField(
                  decoration: deco('Password'),
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
                    child: const Text('Log In', style: TextStyle(fontSize: 16)),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      backgroundColor: Color(0xff7692ff),
                    ),
                    onPressed: () {},
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
