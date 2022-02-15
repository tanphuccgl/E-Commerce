
import 'package:e_commerce/src/models/prefs.dart';

abstract class AccountRepository {
  Future<bool> isLogin();
  Future<void> saveLogin(String response);
}

class AccountRepositoryImpl implements AccountRepository {
  @override
  Future<bool> isLogin() async {
    return Prefs.isLogin();
  }

  @override
  Future<void> saveLogin(String response) async {
    return Prefs.saveLoginLocal(response);
  }
}

class NetworkException implements Exception {}
