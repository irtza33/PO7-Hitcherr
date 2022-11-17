class LandingModel {
  static bool _approved = false; //approval state
  static String _display = ""; //display message state

  static bool get gapproved => _approved; //get approval state

  static String get gdisplay => _display; //get display message

  static void sapproved(bool toSet) {
    //set approval state
    _approved = toSet;
  }

  static void sdisplay(String toSet) {
    //set display message
    _display = toSet;
  }
}
