// ignore_for_file: no_duplicate_case_values

import 'package:e_commerce/src/modules/account/logic/account_bloc.dart';
import 'package:e_commerce/src/modules/auth/logic/sign_bloc.dart';
import 'package:e_commerce/src/modules/dashboard/router/dashboard_router.dart';
import 'package:e_commerce/src/repositories/domain.dart';
import 'package:e_commerce/src/widgets/snackbar/snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

enum LoginParam { email, password }

class LoginBloc extends SignBloc<LoginState> {
  LoginBloc() : super(const LoginState());
  final Domain domain = Domain();

  void changedEmail(String email) {
    emit(state.copyWith(email: email.trim(), pureEmail: true));
  }

  void changedPassword(String password) {
    emit(state.copyWith(password: password.trim(), purePassword: true));
  }

  void login(BuildContext context) async {
    String errorMessage = "";
    FocusScope.of(context).requestFocus(FocusNode());

    emit(state.copyWith(pureEmail: true, purePassword: true));

    if (state.isValidEmail == "" || state.isValidPassword == "") {
      emit(state.copyWith(isLoading: true, messageError: ""));
      try {
        await domain.sign
            .loginWithEmail(email: state.email, password: state.password);

        context.read<AccountBloc>().getLoginLocal();
        DashboardCoordinator.showDashboard(context);
        XSnackBar.show(msg: "Logged in successfully");
      } on FirebaseAuthException catch (error) {
        errorMessage = await domain.sign.handleError(codeError: error.code);

        emit(state.copyWith(isLoading: false, messageError: errorMessage));
      }

      emit(state.copyWith(isLoading: false));
    }
  }

  void loginWithGoogle(BuildContext context) async {
    String errorMessage;
    emit(state.copyWith(isLoading: true, messageError: ""));
    try {
      await domain.sign.loginWithGoogle();

      context.read<AccountBloc>().getLoginLocal();
      DashboardCoordinator.showDashboard(context);
      XSnackBar.show(msg: "Logged in successfully");
    } on FirebaseAuthException catch (error) {
      errorMessage = await domain.sign.handleError(codeError: error.code);

      emit(state.copyWith(isLoading: false, messageError: errorMessage));
    }
    emit(state.copyWith(isLoading: false));
  }
}
