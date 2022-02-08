import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/routes/auto_router.gr.dart';
import '../../../../repositories/domain.dart';
import '../../../../widgets/snackbar/snackbar.dart';

part 'login_state.dart';

// TODO: Bloc này chỉ nên handle các login liên quan tới login và register.
// Nên tạo 1 bloc để quản lý user, và các trạng thái login, no login
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
    context.router.popUntilRouteWithName(LoadingRoute.name );
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
