import 'package:e_commerce/src/config/routes/coordinator.dart';
import 'package:e_commerce/src/modules/auth/login/router/sign_router.dart';
import 'package:e_commerce/src/repositories/domain.dart';
import 'package:e_commerce/src/widgets/snackbar/snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'account_state.dart';

class AccountBloc extends Cubit<AccountState> {
  AccountBloc() : super(const AccountState()) {
    getLoginLocal();
  }

  final Domain domain = Domain();

  Future<void> getLoginLocal() async {
    await Future.delayed(const Duration(seconds: 2));
    final islogin = await domain.login.isLogin();
    emit(state.copyWith(islogin));
  }

  void onLogin(BuildContext context) {
    emit(state.copyWith(true));
    XSnackBar.show(msg: "Logged in successfully");
    domain.login.saveLogin('SAVE_LOGIN_RESPONSE');
    XCoordinator.showDashboard();
  }

  void onRegister(BuildContext context) {
    emit(state.copyWith(true));
    XSnackBar.show(msg: "Logged in successfully");
    domain.login.saveLogin('SAVE_LOGIN_RESPONSE');
    XCoordinator.showDashboard();
  }

  void logout(BuildContext context) {
    emit(state.copyWith(false));
    domain.login.saveLogin("");
    SignCoordinator.showLogin(context);
  }
}
