import 'package:flutter/material.dart';
import 'package:coding/Views/View.dart';

class Userlogin extends StatelessWidget {
  const Userlogin({Key? key}) : super(key: key);

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
