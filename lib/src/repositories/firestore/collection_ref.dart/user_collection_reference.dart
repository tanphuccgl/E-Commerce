import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/src/models/result.dart';
import 'package:e_commerce/src/models/user_model.dart';
import 'package:e_commerce/src/repositories/firestore/collection_ref.dart/base_collection_reference.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserCollectionReference extends BaseCollectionReference {
  UserCollectionReference()
      : super(
            FirebaseFirestore.instance.collection('User').withConverter<XUser>(
                  fromFirestore: (snapshot, _) => XUser.formDocument(snapshot),
                  toFirestore: (userModel, _) => userModel.toJson(),
                ));

  Future<XResult<XUser>> getUserOrAddNew(
    User user, {
    String name = "",
  }) async {
    try {
      late final XUser data;
      final bool result =
          (await ref.where("id", isEqualTo: user.uid).get()).docs.isNotEmpty;

      if (result == false) {
        if (name == "") {
          name = (user.displayName ?? "N/A");
        }
        data = XUser(email: user.email, name: name, id: user.uid);
        add(data);
      } else {
        var value = await ref.where("id", isEqualTo: user.uid).get();
        name = value.docs.first.get("name");

        data = XUser(email: user.email, name: name, id: user.uid);
      }
      return XResult.success(data);
    } catch (e) {
      return XResult.exception(e);
    }
  }
}
