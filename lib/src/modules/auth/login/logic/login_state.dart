part of 'login_bloc.dart';

class LoginState extends SignState {
  bool get isValidLogin {
    return XUtils.isValidLogin(
        email: email,
        pureEmail: pureEmail,
        password: password,
        purePassword: purePassword);
  }

  const LoginState({
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
            purePassword: purePassword);

  @override
  List<Object?> get props => [
        isLoading,
        messageError,
        email,
        password,
        pureEmail,
        purePassword,
      ];

  @override
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
