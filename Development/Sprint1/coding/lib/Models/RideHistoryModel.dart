class RideHistoryModel {
  static int _fare = 0; //fare state
  static int _rating = 0; //rating state

  static int get gfare => _fare; //get fare
  static int get grating => _rating; //get rating

  static void sfare(int toSet) {
    //set fare
    _fare = toSet;
  }

  static void srating(int toSet) {
    //set rating
    _rating = toSet;
  }
}
