import 'package:e_commerce/src/repositories/domain.dart';
import 'package:e_commerce/src/widgets/snackbar/snackbar.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_state.dart';

class SignUpBloc extends Cubit<SignUpState> {
  SignUpBloc() : super(const SignUpState());
  final Domain domain = Domain();

  void changedEmail(String email) {
    emit(state.copyWith(email: email));
  }

  void changedName(String name) {
    emit(state.copyWith(name: name));
  }

  void changePassword(String password) {
    emit(state.copyWith(password: password));
  }

  void createAccount() {
    if(state.isValidEmail==true && state.isValidName==true && state.isValidPassword==true)
    {
  domain.sign
        .signUp(email: state.email, password: state.password, name: state.name)
        .then((value) => XSnackBar.show(msg: "Account successfully created"))
        .onError((error, stackTrace) =>
            XSnackBar.show(msg: "Account creation failed"));
    }
  
  }
}
