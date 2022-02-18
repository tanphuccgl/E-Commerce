// TODO: implement
// TODO extends BaseCollectionReference
import 'package:e_commerce/src/models/result.dart';
import 'package:e_commerce/src/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserCollectionReference {
  // TODO
  Future<XResult<UserModel>> getUserOrAddNew(User user) async {
    try {} catch (e) {
      return XResult.exception(e);
    }
  }
}
