import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:coding/Models/Model.dart';

class Controller extends ControllerMVC {
  factory Controller() {
    if (_this == null) _this = Controller._();
    return _this;
  }

  static Controller _this = Controller._();
  Controller._();

  int get counter => Model.counter;
  void increment() {
    Model.increment();
  }

  void decrement() {
    Model.decrement();
  }
}
