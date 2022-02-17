part of 'sign_bloc.dart';

class SignState extends Equatable {
  final bool isLoading;
  final String messageError;
  const SignState({
    this.isLoading = false,
    this.messageError = '',
  });

  @override
  List<Object?> get props => [isLoading, messageError];
}
