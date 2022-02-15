part of 'login_bloc.dart';

class LoginState extends Equatable {
  // TODO: Lúc đầu thì chưa vội hiễn thị lỗi
  final String email;
  final String password;
  final bool pure;
  // TODO: refactor to string
  // TODO: using regex
  // TODO: learn regex
  bool get isValidEmail => email.length > 5 && (email.contains("@"));
  // TODO: refactor to string
  String get isValidPassword {
    if (pure) {
      return '';
    }
    return password.length > 5 ? '' : 'Error';
  }
  // TODO: show login state: loading/error/

  const LoginState([this.email = "", this.password = "", this.pure = false]);

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
