part of 'sign_up_bloc.dart';

class SignUpState extends Equatable {
  final String name;
  final String email;
  final String password;
  bool get isValidName => name.isNotEmpty ;
  bool get isValidEmail =>
      email.length  > 5 && (email.contains("@") );
  bool get isValidPassword => password.length  > 5;
  const SignUpState([this.name="", this.email="", this.password=""]);

  @override
  List<Object?> get props => [name, email, password];

  SignUpState copyWith({
    String? name,
    String? email,
    String? password,
  }) {
    return SignUpState(
      name ?? this.name,
      email ?? this.email,
      password ?? this.email,
    );
  }
}
