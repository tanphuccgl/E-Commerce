import 'package:e_commerce/src/models/result.dart';
import 'package:e_commerce/src/models/user_model.dart';
import 'package:e_commerce/src/repositories/features/account/repo.dart';
import 'package:e_commerce/src/repositories/firestore/collection_ref.dart/user_collection_reference.dart';
import 'package:e_commerce/src/repositories/firestore/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AccountRepositoryImpl implements AccountRepository {
  @override
  Future<XResult<XUser>> getCurrentUser() async {
    final User? user = AuthService().currentUser;
    try {
      var data = UserCollectionReference().getUserOrAddNew(user!);
      return data;
    } catch (e) {
      return XResult.exception(e);
    }
  }
}
