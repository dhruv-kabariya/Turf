import 'package:shared_preferences/shared_preferences.dart';

class SHpref {
  static SharedPreferences preferences;

  static setup(SharedPreferences pref) {
    preferences = pref;
  }

  static get pref => preferences;
}
