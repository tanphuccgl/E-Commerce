import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/routes/auto_router.gr.dart';
import '../../../../repositories/domain.dart';
import '../../../../widgets/snackbar/snackbar.dart';

part 'login_state.dart';

class LoginBloc extends Cubit<LoginState> {
  LoginBloc() : super(const LoginState()) {
    getLoginLocal();
  }

  final Domain domain = Domain();

  Future<void> getLoginLocal() async {
    final islogin = await domain.login.isLogin();
    emit(state.copyWith(islogin));
  }

  void onDashboard(BuildContext context) {
    context.pushRoute(const DashboardRoute());
    XSnackBar.show(msg: "Logged in successfully");
    emit(state.copyWith(true));
    domain.login.saveLogin('SAVE_LOGIN_RESPONSE');
  }

  void logout(BuildContext context) {
    emit(state.copyWith(false));
    domain.login.saveLogin("");
    context.router.removeUntil((route) => false);

    context.navigateTo(const LoadingRoute());
  }
}
