part of 'login_bloc.dart';

class LoginState {
  final bool? isLogin;
  const LoginState({this.isLogin});

  LoginState copyWith(bool isLogin) {
    return LoginState(isLogin: isLogin);
  }
}
