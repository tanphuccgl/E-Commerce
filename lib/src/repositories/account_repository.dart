import 'package:e_commerce/src/models/user_model.dart';
import 'package:e_commerce/src/repositories/sign_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth = FirebaseAuth.instance;

abstract class AccountRepository {
  Future<UserModel> getCurrentUser();
}

class AccountRepositoryImpl implements AccountRepository {
  @override
  Future<UserModel> getCurrentUser() async {
    User? user = FirebaseAuth.instance.currentUser;

    var value = await ref.doc(user?.uid).get();

    return UserModel.fromJson(value.data()!.toJson());
  }
}

class NetworkException implements Exception {}
