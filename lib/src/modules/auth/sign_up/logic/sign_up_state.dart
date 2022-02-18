part of 'sign_up_bloc.dart';

class SignUpState extends SignState {
  final String name;
  final bool pureName;

  String get isValidName {
    return XUtils.isValidName(name, pureName);
  }

  bool get isValidSignUp {
    return XUtils.isValidSignUp(
      email: email,
      pureEmail: pureEmail,
      password: password,
      purePassword: purePassword,
      name: name,
      pureName: pureName,
    );
  }

  const SignUpState({
    this.name = "",
    this.pureName = false,
    bool isLoading = false,
    String email = "",
    String password = "",
    String messageError = "",
    bool pureEmail = false,
    bool purePassword = false,
  }) : super(
          email: email,
          password: password,
          isLoading: isLoading,
          messageError: messageError,
          pureEmail: pureEmail,
          purePassword: purePassword,
        );

  @override
  List<Object?> get props => [
        name,
        pureName,
        isLoading,
        messageError,
        email,
        password,
        pureEmail,
        purePassword,
      ];

  @override
  SignUpState copyWith({
    String? name,
    bool? pureName,
    bool? isLoading,
    String? email,
    String? password,
    String? messageError,
    bool? pureEmail,
    bool? purePassword,
  }) {
    return SignUpState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      pureName: pureName ?? this.pureName,
      pureEmail: pureEmail ?? this.pureEmail,
      purePassword: purePassword ?? this.purePassword,
      isLoading: isLoading ?? this.isLoading,
      messageError: messageError ?? this.messageError,
    );
  }
}
