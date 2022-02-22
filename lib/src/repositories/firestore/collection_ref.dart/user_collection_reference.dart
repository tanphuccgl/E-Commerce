import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/src/models/result.dart';
import 'package:e_commerce/src/models/user_model.dart';
import 'package:e_commerce/src/repositories/firestore/collection_ref.dart/base_collection_reference.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserCollectionReference extends BaseCollectionReference<XUser> {
  UserCollectionReference()
      : super(
            FirebaseFirestore.instance.collection('User').withConverter<XUser>(
                  fromFirestore: (snapshot, _) => XUser.formDocument(snapshot),
                  toFirestore: (userModel, _) => userModel.toJson(),
                ));

  Future<XResult<XUser>> getUserOrAddNew(User user) async {
    try {
      late final XUser data;

      var result = await get(user.uid);
      if (result.data == null) {
        data = XUser.fromFirebaseUser(user);
        set(data);
      } else {
        var name = result.data?.name;
        data = XUser(
            email: user.email, name: name ?? user.displayName, id: user.uid);
      }
      return XResult.success(data);
    } catch (e) {
      return XResult.exception(e);
    }
  }
}
