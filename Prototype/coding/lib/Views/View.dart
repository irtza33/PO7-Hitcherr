import 'package:coding/Views/loginfirst.dart';
import 'package:coding/Views/Signup.dart';

import 'package:flutter/material.dart';
import 'package:coding/Controllers/Controller.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class View extends StatefulWidget {
  const View({Key? key}) : super(key: key);
  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {
  final Controller _controller = Controller();
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
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: Container(
                  height: 360.0,
                  width: 360.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/Hitcherr_logo.png'),
                      fit: BoxFit.fill,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                    padding: const EdgeInsets.only(top: 100, left: 3),
                    child: SizedBox(
                        width: 250,
                        height: 50,
                        child: ElevatedButton(
                          child: const Text('Login',
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
                                    builder: (_) => loginfirst()));
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
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(fontSize: 18),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            backgroundColor: Color(0xff7692ff),
                          ),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => Signup()));
                          },
                        ))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
