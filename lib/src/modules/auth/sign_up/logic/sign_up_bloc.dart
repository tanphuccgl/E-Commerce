import 'package:e_commerce/src/modules/dashboard/router/dashboard_router.dart';
import 'package:e_commerce/src/repositories/domain.dart';
import 'package:e_commerce/src/widgets/snackbar/snackbar.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_state.dart';

// TODO extends SignState
class SignUpBloc extends Cubit<SignUpState> {
  SignUpBloc() : super(const SignUpState());
  final Domain domain = Domain();

  void changedEmail(String email) {
    emit(state.copyWith(email: email.trim(), pureEmail: true));
  }

  void changedName(String name) {
    emit(state.copyWith(name: name.trimLeft(), pureName: true));
  }

  void changePassword(String password) {
    emit(state.copyWith(password: password.trim(), purePassword: true));
  }

  void createAccount(BuildContext context) async {
    String errorMessage;
    FocusScope.of(context).requestFocus(FocusNode());
    emit(state.copyWith(
      pureEmail: true,
      pureName: true,
      purePassword: true,
    ));

    if (state.isValidEmail == "" &&
        state.isValidName == "" &&
        state.isValidPassword == "") {
      emit(state.copyWithLoading(isLoading: true, messageError: ""));
      try {
        await domain.sign
            .signUp(
                email: state.email, password: state.password, name: state.name)
            .then((value) {
          DashboardCoordinator.showDashboard(context);
          XSnackBar.show(msg: "Account successfully created");
        });
      } on FirebaseAuthException catch (error) {
        errorMessage = await domain.sign.handleError(codeError: error.code);

        emit(state.copyWithLoading(
            isLoading: false, messageError: errorMessage));
      }

      emit(state.copyWithLoading(isLoading: false));
    }
  }
}
