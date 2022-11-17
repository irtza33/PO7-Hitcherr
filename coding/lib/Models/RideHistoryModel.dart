class RideHistoryModel {
  static int _fare = 0;
  static int _rating = 0;

  static int get gfare => _fare;
  static int get grating => _rating;

  static void sfare(int toSet) {
    _fare = toSet;
  }

  static void srating(int toSet) {
    _rating = toSet;
  }
}
