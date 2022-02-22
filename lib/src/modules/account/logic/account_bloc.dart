import 'package:e_commerce/src/models/user_model.dart';
import 'package:e_commerce/src/modules/auth/login/router/sign_router.dart';
import 'package:e_commerce/src/repositories/domain.dart';
import 'package:e_commerce/src/repositories/firestore/collection_ref.dart/user_collection_reference.dart';
import 'package:e_commerce/src/repositories/firestore/services/auth_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'account_state.dart';

class AccountBloc extends Cubit<AccountState> {
  AccountBloc() : super(AccountState(data: XUser.empty())) {
    _getUser();
  }
  final Domain domain = Domain();
  Future<void> _getUser() async {
    User? currentUser = AuthService().currentUser;

    if (currentUser == null) {
      emit(state.copyWith(isLoading: false, data: XUser.empty()));
    } else {
      var result = await UserCollectionReference().getUserOrAddNew(currentUser);
      var data = result.data ?? XUser.empty();

      emit(state.copyWith(data: data, isLoading: false));
    }
  }

  void setDataLogin({XUser? user}) {
    emit(state.copyWith(data: user, isLoading: false));
  }

  Future<void> logout(BuildContext context) async {
    await Future.delayed(Duration.zero);

    emit(state.copyWith(isLoading: true, data: XUser.empty()));
    domain.sign.logout();
    SignCoordinator.showSignUp(context);
  }
}
