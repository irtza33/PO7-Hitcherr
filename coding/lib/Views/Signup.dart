import 'package:flutter/material.dart';
import 'package:coding/Controllers/SignupController.dart';
import 'package:coding/Views/View.dart';
import 'package:coding/Views/Landing.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String dropdownVal = "Driver";
  final SignupController _controller = SignupController();

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
                  obscureText: true,
                  obscuringCharacter: "*",
                  onChanged: (value) => _controller.setPassword(value),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                padding: const EdgeInsets.only(top: 50, left: 3),
                child: TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Full Name'),
                  onChanged: (value) => _controller.setName(value),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                padding: const EdgeInsets.only(top: 50, left: 3),
                child: TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'CNIC'),
                  keyboardType: TextInputType.number,
                  onChanged: (value) => _controller.setCnic(value),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                padding: const EdgeInsets.only(top: 50, left: 3),
                child: TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Phone Number'),
                  keyboardType: TextInputType.number,
                  onChanged: (value) => _controller.setPhone(value),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, right: 230),
              child: Text(
                'Register As',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                padding: const EdgeInsets.only(top: 20, right: 200),
                child: DropdownButton<String>(
                  value: _controller.getType() == 1 ? "Customer" : "Driver",
                  items: <String>['Driver', 'Customer']
                      .map<DropdownMenuItem<String>>((String val) {
                    return DropdownMenuItem<String>(
                      value: val,
                      child: Text(
                        val,
                        style: TextStyle(fontSize: 25),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newVal) {
                    setState(() {
                      if (newVal == "Driver") {
                        _controller.setType(0);
                      } else {
                        _controller.setType(1);
                      }
                    });
                  },
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
                        child: const Text('SignUp'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(250, 255, 0, 0),
                        ),
                        onPressed: () {
                          _controller.signIn().then(
                            (value) {
                              if (value != null && value.user != null) {
                                _controller.updateDB(value.user);
                                print("New Account Made");
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => Landing())).onError(
                                  (error, stackTrace) {
                                    print("Error ${error.toString()}");
                                  },
                                );
                              }
                            },
                          );
                        },
                      ))),
            )
          ],
        ),
      ),
    );
  }
}
