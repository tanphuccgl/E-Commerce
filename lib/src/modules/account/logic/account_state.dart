part of 'account_bloc.dart';

class AccountState extends Equatable {
  final XUser data;
  final bool isLoading;
  const AccountState({this.isLoading = true, required this.data});
  @override
  List<Object?> get props => [isLoading, data];
  AccountState copyWith({
    bool? isLoading,
    XUser? data,
  }) {
    return AccountState(
      isLoading: isLoading ?? this.isLoading,
      data: data ?? this.data,
    );
  }
}
