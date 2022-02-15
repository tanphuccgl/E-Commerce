part of 'login_bloc.dart';

class LoginState extends Equatable {
  final String email;
  final String password;
  bool get isValidEmail => email.length > 5 && (email.contains("@"));
  bool get isValidPassword => password.length > 5;
  const LoginState([this.email = "", this.password = ""]);

  @override
  List<Object?> get props => [email, password];

  LoginState copyWith({
    String? email,
    String? password,
  }) {
    return LoginState(
      email ?? this.email,
      password ?? this.email,
    );
  }
}
