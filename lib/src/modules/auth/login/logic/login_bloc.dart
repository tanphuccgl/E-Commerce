import 'package:e_commerce/src/modules/account/logic/account_bloc.dart';
import 'package:e_commerce/src/modules/auth/logic/sign_bloc.dart';
import 'package:e_commerce/src/modules/dashboard/router/dashboard_router.dart';
import 'package:e_commerce/src/utils/utils.dart';
import 'package:e_commerce/src/widgets/snackbar/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginBloc extends SignBloc<LoginState> {
  LoginBloc() : super(const LoginState());

  void loginWithEmailAndPassword(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());

    String messageError = "";

    emit(state.copyWith(isLoading: true, messageError: messageError));

    emit(state.copyWith(pureEmail: true, purePassword: true));

    if (state.isValidLogin) {
      var value = await domain.sign
          .loginWithEmail(email: state.email, password: state.password);
      if (value.isSuccess) {
        context.read<AccountBloc>().setDataLogin(user: value.data);
        DashboardCoordinator.showDashboard(context);
        XSnackBar.show(msg: "Logged in successfully");
      } else {
        emit(state.copyWith(messageError: value.error));
      }
    }
    emit(state.copyWith(isLoading: false));
  }
}
