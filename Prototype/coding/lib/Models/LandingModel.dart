class LandingModel {
  static bool _approved = false;
  static String _display = "";

  static bool get gapproved => _approved;

  static String get gdisplay => _display;

  static void sapproved(bool toSet) {
    _approved = toSet;
  }

  static void sdisplay(String toSet) {
    _display = toSet;
  }
}
