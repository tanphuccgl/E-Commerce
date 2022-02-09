// ignore_for_file: constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

class _Key {
  static const String SAVE_LOGIN_RESPONSE = "SAVE_LOGIN_RESPONSE";
}

class Prefs {
  static late SharedPreferences _prefs;

  static init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static void saveLoginLocal(String response) {
    _prefs.setString(_Key.SAVE_LOGIN_RESPONSE, response);
  }

  static bool isLogin() {
    final result = _prefs.getString(_Key.SAVE_LOGIN_RESPONSE);
    if (result != null && result != '') {
      return true;
    }
    return false;
  }
}
