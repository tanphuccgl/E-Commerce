// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:e_commerce/src/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _Key {
  static const String SAVE_LOGIN_RESPONSE = "SAVE_LOGIN_RESPONSE";
}

class Prefs {
  static late SharedPreferences _prefs;

  static init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> saveLoginLocal(UserModel response) async {
    await _prefs.setString(
        _Key.SAVE_LOGIN_RESPONSE, json.encode(response.toJson()));
  }

  static Future<void> logout() async {
    await _prefs.setString(_Key.SAVE_LOGIN_RESPONSE, "");
  }

  static Future<UserModel> isLogin() async {
    final result = _prefs.getString(_Key.SAVE_LOGIN_RESPONSE);
    if (result != null && result != '') {
      return Future.value(UserModel.fromJson(json.decode(result)));
    } else {
      throw Exception();
    }
  }
}
