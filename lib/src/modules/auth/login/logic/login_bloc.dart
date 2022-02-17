import 'package:e_commerce/src/modules/account/logic/account_bloc.dart';
import 'package:e_commerce/src/modules/dashboard/router/dashboard_router.dart';
import 'package:e_commerce/src/repositories/domain.dart';
import 'package:e_commerce/src/widgets/snackbar/snackbar.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

enum LoginParam { email, password }

class LoginBloc extends Cubit<LoginState> {
  LoginBloc() : super(const LoginState());
  final Domain domain = Domain();

  void changedEmail(String email) {
    emit(state.copyWith(email: email.trim(), pureEmail: true));
  }

  void changedPassword(String password) {
    emit(state.copyWith(password: password.trim(), purePassword: true));
  }

  void login(BuildContext context) async {
    String errorMessage;
    FocusScope.of(context).requestFocus(FocusNode());

    emit(state.copyWith(pureEmail: true, purePassword: true));

    if (state.isValidEmail == "" || state.isValidPassword == "") {
      emit(state.copyWithLoading(isLoading: true, messageError: ""));
      try {
        var result = await domain.sign
            .loginWithEmail(email: state.email, password: state.password);

        await domain.account.saveLogin(result).then((value) {
          context.read<AccountBloc>().getLoginLocal().then((value) {
            DashboardCoordinator.showDashboard(context);
            XSnackBar.show(msg: "Logged in successfully");
          });
        });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "ERROR_EMAIL_ALREADY_IN_USE":
          case "account-exists-with-different-credential":
          case "email-already-in-use":
            errorMessage = "Email already used. Go to login page.";
            break;
          case "ERROR_WRONG_PASSWORD":
          case "wrong-password":
            errorMessage = "Wrong email/password combination.";
            break;
          case "ERROR_USER_NOT_FOUND":
          case "user-not-found":
            errorMessage = "No user found with this email.";
            break;
          case "ERROR_USER_DISABLED":
          case "user-disabled":
            errorMessage = "User disabled.";
            break;
          case "ERROR_TOO_MANY_REQUESTS":
          case "operation-not-allowed":
            errorMessage = "Too many requests to log into this account.";
            break;
          case "ERROR_OPERATION_NOT_ALLOWED":
          // ignore: no_duplicate_case_values
          case "operation-not-allowed":
            errorMessage = "Server error, please try again later.";
            break;
          case "ERROR_INVALID_EMAIL":
          case "invalid-email":
            errorMessage = "Email address is invalid.";
            break;
          default:
            errorMessage = "Login failed. Please try again.";
            break;
        }
        emit(state.copyWithLoading(
            isLoading: false, messageError: errorMessage));
      }

      emit(state.copyWithLoading(isLoading: false));
    }
  }

  void loginWithGoogle(BuildContext context) async {
    emit(state.copyWithLoading(isLoading: true, messageError: ""));
    try {
      var result = await domain.sign.loginWithGoogle();
      await domain.account.saveLogin(result).then((value) {
        context.read<AccountBloc>().getLoginLocal().then((value) {
          DashboardCoordinator.showDashboard(context);
          XSnackBar.show(msg: "Logged in successfully");
        });
      });
    } catch (e) {
      emit(state.copyWithLoading(isLoading: false, messageError: e.toString()));
    }
    emit(state.copyWithLoading(isLoading: false));
  }
}
