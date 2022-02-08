part of 'account_bloc.dart';

class AccountState {
  final bool? isLogin;
  const AccountState({this.isLogin});

  AccountState copyWith(bool isLogin) {
    return AccountState(isLogin: isLogin);
  }
}
