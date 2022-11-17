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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home Page"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_controller != null ? '${_controller.counter}' : "0",
                  style: TextStyle(fontSize: 25)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        _controller.increment();
                      });
                    },
                    child: Icon(Icons.add),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        _controller.decrement();
                      });
                    },
                    child: Icon(Icons.remove),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
