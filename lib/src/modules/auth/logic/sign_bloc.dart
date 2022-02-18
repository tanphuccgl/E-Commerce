import 'package:e_commerce/src/models/result.dart';
import 'package:e_commerce/src/models/user_model.dart';
import 'package:e_commerce/src/modules/account/logic/account_bloc.dart';
import 'package:e_commerce/src/modules/dashboard/router/dashboard_router.dart';
import 'package:e_commerce/src/repositories/domain.dart';
import 'package:e_commerce/src/utils/utils.dart';
import 'package:e_commerce/src/widgets/snackbar/snackbar.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_state.dart';

class SignBloc<T extends SignState> extends Cubit<T> {
  SignBloc(T initialState) : super(initialState);
  final Domain domain = Domain();

  void changedEmail(String email) {
    emit(state.copyWith(email: email.trim(), pureEmail: true) as T);
  }

  void changedPassword(String password) {
    emit(state.copyWith(password: password.trim(), purePassword: true) as T);
  }

  void withGoogle(BuildContext context) async {
    String messageError = "";
    emit(state.copyWith(isLoading: true, messageError: messageError) as T);
    try {
      final XResult<UserModel> result = await domain.sign.loginWithGoogle();
      await context.read<AccountBloc>().getDataLogin();
      DashboardCoordinator.showDashboard(context);
      XSnackBar.show(msg: "Logged in successfully");
    } on FirebaseAuthException catch (error) {
      handleError(error.code, messageError);
    }
    emit(state.copyWith(isLoading: false) as T);
  }

  void handleError(String errorCode, String errorMessage) async {
    // errorMessage = await domain.sign.handleError(codeError: errorCode);

    emit(state.copyWith(messageError: errorMessage) as T);
  }
}
