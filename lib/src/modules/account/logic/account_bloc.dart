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
      var value = await domain.account.isLogin();
      emit(state.copyWith(data: value, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, data: null));
    }
  }

  void logout(BuildContext context) {
    domain.account.logout();
    emit(state.copyWith(isLoading: true, data: null));  

    SignCoordinator.showSignUp(context);
  }
}
