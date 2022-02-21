import 'package:e_commerce/src/modules/account/logic/account_bloc.dart';
import 'package:e_commerce/src/modules/auth/logic/sign_bloc.dart';
import 'package:e_commerce/src/modules/dashboard/router/dashboard_router.dart';
import 'package:e_commerce/src/utils/utils.dart';
import 'package:e_commerce/src/widgets/snackbar/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_state.dart';

enum SignUpWithParam { emailAndPassword, google }

class SignUpBloc extends SignBloc<SignUpState> {
  SignUpBloc() : super(const SignUpState());

  void changedName(String name) {
    emit(state.copyWith(name: name.trimLeft(), pureName: true));
  }

  void createAccount(BuildContext context) async {
    // TODO: check isLoading
    String messageError = "";
    FocusScope.of(context).requestFocus(FocusNode());
    emit(state.copyWith(
      pureEmail: true,
      pureName: true,
      purePassword: true,
    ));

    if (state.isValidSignUp) {
      emit(state.copyWith(isLoading: true, messageError: messageError));
      try {
        var value = await domain.sign.signUp(
            email: state.email, password: state.password, name: state.name);
        if (value.error == null) {
          await context.read<AccountBloc>().setDataLogin(user: value.data);
          DashboardCoordinator.showDashboard(context);
          XSnackBar.show(msg: "Account successfully created");
        } else {
          emit(state.copyWith(messageError: value.error));
        }
      } catch (error) {
        emit(state.copyWith(messageError: error.toString()));
      }

      emit(state.copyWith(isLoading: false));
    }
  }
}
