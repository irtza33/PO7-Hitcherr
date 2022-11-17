class Model {
  static int _counter = 0;
  static int get counter => _counter;
  static int increment() => ++_counter;
  static int decrement() => --_counter;
}
