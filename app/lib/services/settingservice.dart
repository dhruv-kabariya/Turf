import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingService {
  final SharedPreferences preferences;
  SettingService({@required this.preferences});

  bool checkTheme() {
    bool theme = this.preferences.getBool("theme");
    if (theme == null) {
      this.preferences.setBool("theme", true);
      return true;
    } else {
      return this.preferences.getBool("theme");
    }
  }

  bool changetheme() {
    bool theme = this.preferences.getBool("theme") ?? true;
    this.preferences.setBool("theme", !theme);
    return !theme;
  }
}
