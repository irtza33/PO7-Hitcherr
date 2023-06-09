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
  String dropdownVal = "Driver"; //Initialise dropdown value with Driver
  final SignupController _controller =
      SignupController(); //Initialise controller with signup controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          true, //Controlling for screen resizing upon keyboard popup
      appBar: AppBar(
        title: Text('Sign Up'),
        backgroundColor: Color(0xff4a44bf),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Text(
                  'Account Details',
                  style: TextStyle(fontSize: 26),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  padding: const EdgeInsets.only(top: 30, left: 3),
                  child: TextField(
                    decoration: deco('Email Address'),
                    onChanged: (value) => _controller
                        .setEmail(value), //Set model state via controller
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
                    obscuringCharacter: "*", //hide password
                    onChanged: (value) => _controller.setPassword(
                        value), //Update model state using controller
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  padding: const EdgeInsets.only(top: 50, left: 3),
                  child: TextField(
                    decoration: deco('Full Name'),
                    onChanged: (value) => _controller
                        .setName(value), //Change model state via controller
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  padding: const EdgeInsets.only(top: 50, left: 3),
                  child: TextField(
                    decoration: deco('CNIC'),
                    keyboardType: TextInputType.number,
                    onChanged: (value) => _controller
                        .setCnic(value), //Change model state via controller
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  padding: const EdgeInsets.only(top: 50, left: 3),
                  child: TextField(
                    decoration: deco('Phone Number'),
                    keyboardType: TextInputType.number,
                    onChanged: (value) => _controller
                        .setPhone(value), //Change model state via controller
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Account Type:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(50, 58, 80, 1),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          dropdownColor: Color.fromRGBO(50, 58, 80, 1),
                          value: _controller.getType() == 1
                              ? "Customer"
                              : "Driver",
                          items: <String>['Driver', 'Customer']
                              .map<DropdownMenuItem<String>>((String val) {
                            //Map String List to drop down menu items
                            return DropdownMenuItem<String>(
                              value: val,
                              child: Text(
                                val,
                                style: TextStyle(fontSize: 18),
                              ),
                            );
                          }).toList(), //Convert to list
                          onChanged: (String? newVal) {
                            setState(() {
                              if (newVal == "Driver") {
                                _controller.setType(
                                    0); //Set model state via controller upon choosing from dropdown menu
                              } else {
                                _controller.setType(1);
                              }
                            });
                          },
                        ),
                      ),
                    ),
                  ],
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
                            'Register',
                            style: TextStyle(fontSize: 16),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            backgroundColor: Color(0xff7692ff),
                          ),
                          onPressed: () {
                            _controller.signUp().then(
                              //Controller signs up the user
                              (value) {
                                if (value != null && value.user != null) {
                                  _controller.updateDB(value
                                      .user); //Update firestore upon signing up
                                  print("New Account Made");
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => View())).onError(
                                    //navigate to view upon successful signup
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
