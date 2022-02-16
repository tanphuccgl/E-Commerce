import 'package:e_commerce/src/models/prefs.dart';
import 'package:e_commerce/src/models/user_model.dart';

abstract class AccountRepository {
  Future<UserModel> isLogin();
  Future<void> saveLogin(UserModel response);
  Future<void> logout();
}

class AccountRepositoryImpl implements AccountRepository {
  @override
  Future<UserModel> isLogin() async {
    return Prefs.isLogin();
  }

  @override
  Future<void> saveLogin(UserModel response) async {
    return Prefs.saveLoginLocal(response);
  }

  @override
  Future<void> logout() async {
    return Prefs.logout();
  }
}

class NetworkException implements Exception {}
