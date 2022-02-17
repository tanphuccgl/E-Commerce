part of 'login_bloc.dart';

class LoginState extends SignState {
  // TODO: move to Sign State
  final String email;
  final String password;
  final bool pureEmail;
  final bool purePassword;

  // TODO to utils.dart
  // add Unit test
  String get isValidEmail {
    // check email
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);

    if (pureEmail == false) {
      return "";
    }
    return (email.length > 5 && emailValid) ? "" : "Invalid Email";
  }

  // TODO to utils.dart
  // add Unit test
  String get isValidPassword {
    if (purePassword == false) {
      return '';
    }
    return password.length > 5 ? '' : 'Invalid Password';
  }

  const LoginState(
      {this.email = "",
      this.password = "",
      this.pureEmail = false,
      this.purePassword = false,
      bool isLoading = false,
      String messageError = ""})
      : super(
          isLoading: isLoading,
          messageError: messageError,
        );

  @override
  List<Object?> get props =>
      [email, password, pureEmail, purePassword, isLoading, messageError];

  LoginState copyWith({
    String? email,
    String? password,
    bool? pureEmail,
    bool? purePassword,
    bool? isLoading,
    String? messageError,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      pureEmail: pureEmail ?? this.pureEmail,
      purePassword: purePassword ?? this.purePassword,
      isLoading: isLoading ?? this.isLoading,
      messageError: messageError ?? this.messageError,
    );
  }
}
