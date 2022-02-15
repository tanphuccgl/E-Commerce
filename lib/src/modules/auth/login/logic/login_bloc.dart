import 'package:e_commerce/src/repositories/domain.dart';
import 'package:e_commerce/src/widgets/snackbar/snackbar.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginBloc extends Cubit<LoginState> {
  LoginBloc() : super(const LoginState());
  final Domain domain = Domain();

  void changedEmail(String email) {
    emit(state.copyWith(email: email));
  }

  void changePassword(String password) {
    emit(state.copyWith(password: password));
  }

  void login() {
    if (state.isValidEmail == true || state.isValidPassword == true) {
      domain.sign
          .loginWithEmail(email: state.email, password: state.password)
          .then((value) => XSnackBar.show(msg: "Logged in successfully"))
          .onError((error, stackTrace) => XSnackBar.show(msg: "Login failed"));
    }
  }
}
