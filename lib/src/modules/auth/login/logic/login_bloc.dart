import 'package:e_commerce/src/modules/account/logic/account_bloc.dart';
import 'package:e_commerce/src/modules/dashboard/router/dashboard_router.dart';
import 'package:e_commerce/src/repositories/domain.dart';
import 'package:e_commerce/src/widgets/snackbar/snackbar.dart';
import 'package:equatable/equatable.dart';
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

  void clear({required LoginParam param}) {
    switch (param) {
      case LoginParam.email:
        changedEmail("");

        break;
      case LoginParam.password:
        changedPassword("");

        break;
    }
  }

  void login(BuildContext context) async {
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
      } catch (e) {
        emit(state.copyWithLoading(
            isLoading: false, messageError: e.toString()));
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
