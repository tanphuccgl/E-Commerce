import '../models/prefs.dart';

abstract class LoginRepository {
  Future<bool> isLogin();
  Future<void> saveLogin(String response);
}

class LoginRepositoryImpl implements LoginRepository {
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
