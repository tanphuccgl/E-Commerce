import 'package:e_commerce/src/config/routes/coordinator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../repositories/domain.dart';
import '../../../../widgets/snackbar/snackbar.dart';

part 'login_state.dart';

// TODO: Rename and move to account folder
class LoginBloc extends Cubit<LoginState> {
  LoginBloc() : super(const LoginState()) {
    getLoginLocal();
  }

  final Domain domain = Domain();

  Future<void> getLoginLocal() async {
    await Future.delayed(const Duration(seconds: 2));
    final islogin = await domain.login.isLogin();
    emit(state.copyWith(islogin));
  }

  void onLogin(BuildContext context) {
    //
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
    XCoordinator.showLogin();
  }
}
