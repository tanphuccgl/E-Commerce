import 'package:e_commerce/src/modules/auth/logic/sign_bloc.dart';
import 'package:e_commerce/src/modules/dashboard/router/dashboard_router.dart';
import 'package:e_commerce/src/utils/utils.dart';
import 'package:e_commerce/src/widgets/snackbar/snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

part 'sign_up_state.dart';

enum SignUpWithParam { emailAndPassword, google }

class SignUpBloc extends SignBloc<SignUpState> {
  SignUpBloc() : super(const SignUpState());

  void changedName(String name) {
    emit(state.copyWith(name: name.trimLeft(), pureName: true));
  }

  void createAccount(BuildContext context) async {
    String messageError = "";
    FocusScope.of(context).requestFocus(FocusNode());
    emit(state.copyWith(
      pureEmail: true,
      pureName: true,
      purePassword: true,
    ));

    if (state.isValidSignUp) {
      emit(state.copyWithLoading(isLoading: true, messageError: messageError));
      try {
        await domain.sign.signUp(
            email: state.email, password: state.password, name: state.name);

        DashboardCoordinator.showDashboard(context);
        XSnackBar.show(msg: "Account successfully created");
      } on FirebaseAuthException catch (error) {
        handleError(error.code, messageError);
      }

      emit(state.copyWithLoading(isLoading: false));
    }
  }
}
