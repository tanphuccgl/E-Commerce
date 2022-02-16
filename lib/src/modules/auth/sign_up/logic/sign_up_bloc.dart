import 'package:e_commerce/src/modules/auth/login/router/sign_router.dart';
import 'package:e_commerce/src/repositories/domain.dart';
import 'package:e_commerce/src/widgets/snackbar/snackbar.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_state.dart';

enum SignUpParam { email, password, name }

class SignUpBloc extends Cubit<SignUpState> {
  SignUpBloc() : super(const SignUpState());
  final Domain domain = Domain();

  void changedEmail(String email) {
    emit(state.copyWith(email: email.trim(), pureEmail: true));
  }

  void changedName(String name) {
    emit(state.copyWith(name: name, pureName: true));
  }

  void changePassword(String password) {
    emit(state.copyWith(password: password.trim(), purePassword: true));
  }

  void clear(SignUpParam param) {
    switch (param) {
      case SignUpParam.email:
        changedEmail("");

        break;
      case SignUpParam.name:
        changedName("");

        break;
      case SignUpParam.password:
        changePassword("");

        break;
      default:
    }
  }

  void createAccount(BuildContext context) async {
    emit(state.copyWith(
      pureEmail: true,
      pureName: true,
      purePassword: true,
    ));

    if (state.isValidEmail == "" &&
        state.isValidName == "" &&
        state.isValidPassword == "") {
      emit(state.copyWithLoading(
        isLoading: true,
      ));
      await domain.sign
          .signUp(
              email: state.email, password: state.password, name: state.name)
          .then((value) {
        SignCoordinator.showLogin(context);
        XSnackBar.show(msg: "Account successfully created");
      }).onError((error, stackTrace) {
        emit(state.copyWithLoading(
            isLoading: false, messageError: error.toString()));
      });
      emit(state.copyWithLoading(isLoading: false));
    }
  }
}
