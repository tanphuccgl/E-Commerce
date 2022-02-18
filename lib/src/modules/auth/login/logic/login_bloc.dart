// ignore_for_file: no_duplicate_case_values

import 'package:e_commerce/src/modules/account/logic/account_bloc.dart';
import 'package:e_commerce/src/modules/auth/logic/sign_bloc.dart';
import 'package:e_commerce/src/modules/dashboard/router/dashboard_router.dart';
import 'package:e_commerce/src/utils/utils.dart';
import 'package:e_commerce/src/widgets/snackbar/snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginBloc extends SignBloc<LoginState> {
  LoginBloc() : super(const LoginState());

  void loginWithEmailAndPassword(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());

    String messageError = "";

    emit(state.copyWith(isLoading: true, messageError: messageError));
    try {
      emit(state.copyWith(pureEmail: true, purePassword: true));

      if (state.isValidLogin) {
        await domain.sign
            .loginWithEmail(email: state.email, password: state.password);
        await context.read<AccountBloc>().getDataLogin();
        DashboardCoordinator.showDashboard(context);
        XSnackBar.show(msg: "Logged in successfully");
      }
    } on FirebaseAuthException catch (error) {
      handleError(error.code, messageError);
    }

    emit(state.copyWith(isLoading: false,));
  }
}
