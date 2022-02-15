import 'package:e_commerce/src/repositories/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_state.dart';

class SignBloc extends Cubit<SignState> {
  SignBloc(SignState initialState) : super(initialState);

  final Domain domain = Domain();
  void onLoginWithEmail(String email, password) {
    domain.sign.loginWithEmail(email, password);
  }

  void onSignUp(String email,String password) {
    domain.sign.signUp(email, password);
  }

  void onLoginWithGoogle() {}
}
