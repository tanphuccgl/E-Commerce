import 'package:e_commerce/src/constants/app_constrants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static late SharedPreferences _prefs;

  static init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static void logOut() {
    _prefs.setString(SAVE_LOGIN_RESPONSE, '');
  }

  static void saveLogin() {
    _prefs.setString(SAVE_LOGIN_RESPONSE, 'SAVE_LOGIN_RESPONSE');
  }

  static bool isLogin() {
    final result = _prefs.getString(SAVE_LOGIN_RESPONSE);
    if (result != null && result != '') {
      return true;
    }
    return false;
  }
}
