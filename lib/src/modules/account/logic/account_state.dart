part of 'account_bloc.dart';

class AccountState {
  final UserModel? data;
  final bool? isLoading;
  const AccountState([this.isLoading = true, this.data]);

  AccountState copyWith({bool? isLoading, UserModel? data}) {
    return AccountState(isLoading ?? this.isLoading, data ?? this.data);
  }
}
