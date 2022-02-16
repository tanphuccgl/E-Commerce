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
    // check email
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);

    if (pureEmail == false) {
      return "";
    }
    return (email.length > 5 && emailValid) ? "" : "Invalid Email";
  }

  String get isValidPassword {
    if (purePassword == false) {
      return '';
    }
    return password.length > 5 ? '' : 'Invalid Password';
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

  SignUpState copyWithLoading({
     String? name,
    String? email,
    String? password,
    bool? isLoading,
    String? messageError,
  }) {
    return SignUpState(  name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
      isLoading: isLoading ?? this.isLoading,
      messageError: messageError ?? this.messageError,
    );
  }
}
