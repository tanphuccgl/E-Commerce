import 'package:e_commerce/src/models/users_model.dart';
import 'package:e_commerce/src/modules/auth/login/router/sign_router.dart';
import 'package:e_commerce/src/repositories/domain.dart';
import 'package:e_commerce/src/repositories/firestore/collection_ref.dart/users_collection_reference.dart';
import 'package:e_commerce/src/repositories/firestore/services/auth_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'account_state.dart';

class AccountBloc<T extends AccountState> extends Cubit<T> {
  AccountBloc(T initialState) : super(initialState) {
    _getUser();
  }
  final Domain domain = Domain();
  Future<void> _getUser() async {
    await Future.delayed(Duration.zero);

    User? currentUser = AuthService().currentUser;

    if (currentUser == null) {
      emit(state.copyWith(isLoading: false, data: XUser.empty()) as T);
    } else {
      var result = await UserCollectionReference().getUserOrAddNew(currentUser);
      var data = result.data ?? XUser.empty();

      emit(state.copyWith(data: data, isLoading: false) as T);
    }
  }

  void setDataLogin({XUser? user}) {
    emit(state.copyWith(data: user, isLoading: false) as T);
  }

  Future<void> logout(BuildContext context) async {
    await Future.delayed(Duration.zero);

    emit(state.copyWith(isLoading: true, data: XUser.empty()) as T);
    domain.sign.logout();
    SignCoordinator.showSignUp(context);
  }
}
