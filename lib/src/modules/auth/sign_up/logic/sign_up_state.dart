part of 'sign_up_bloc.dart';

class SignUpState extends Equatable {
  final String name;
  final String email;
  final String password;
  final bool pureName;
  final bool pureEmail;
  final bool purePassword;
  final bool isLoading;
  final String messageError;

  String get isValidName {
    if (pureName == false) {
      return "";
    }
    return name.isNotEmpty ? "" : "Invalid Name";
  }

  String get isValidEmail {
    return Utils.isValidLoginEmail(email);
  }

  String get isValidPassword {
    return Utils.isValidPassword(email);
  }

  const SignUpState(
      {this.name = "",
      this.email = "",
      this.password = "",
      this.pureName = false,
      this.pureEmail = false,
      this.purePassword = false,
      this.isLoading = false,
      this.messageError = ""});

  @override
  List<Object?> get props => [
        name,
        email,
        password,
        pureName,
        pureEmail,
        purePassword,
        isLoading,
        messageError
      ];

  // TODO
  SignUpState copyWith({
    String? name,
    String? email,
    String? password,
    bool? pureName,
    bool? pureEmail,
    bool? purePassword,
  }) {
    return SignUpState(
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        pureName: pureName ?? this.pureName,
        pureEmail: pureEmail ?? this.pureEmail,
        purePassword: purePassword ?? this.purePassword);
  }

  // TODO
  SignUpState copyWithLoading({
    bool? isLoading,
    String? messageError,
  }) {
    return copyWith(
      isLoading: isLoading ?? this.isLoading,
      messageError: messageError ?? this.messageError,
    );
  }
}
