import 'package:e_commerce/src/models/user_model.dart';
import 'package:e_commerce/src/modules/auth/login/router/sign_router.dart';
import 'package:e_commerce/src/repositories/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'account_state.dart';

class AccountBloc extends Cubit<AccountState> {
  AccountBloc() : super(const AccountState()) {
    getLoginLocal();
  }

  final Domain domain = Domain();

  Future<void> getLoginLocal() async {
    try {
      dynamic value = await domain.account.getCurrentUser();
      value != null
          ? emit(state.copyWith(data: value, isLoading: false))
          : emit(state.copyWith(data: null, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, data: null));
    }
  }

  void logout(BuildContext context) {
    domain.sign.logout();
    emit(state.copyWith(isLoading: true, data: null));

    SignCoordinator.showSignUp(context);
  }
}
