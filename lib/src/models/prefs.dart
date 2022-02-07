import 'package:e_commerce/src/constants/app_constrants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static late SharedPreferences _prefs;

  static init() async {
    _prefs = await SharedPreferences.getInstance();
  }

 
  static void saveLoginLocal(String response) {
    _prefs.setString(AppConstrants.SAVE_LOGIN_RESPONSE,response );
  }



  static bool isLogin() {
    final result = _prefs.getString(AppConstrants.SAVE_LOGIN_RESPONSE);
    if (result != null && result != '') {
      return true;
    }
    return false;
  }
}
