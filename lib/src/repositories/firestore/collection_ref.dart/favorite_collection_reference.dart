import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/models/result.dart';
import 'package:e_commerce/src/repositories/firestore/collection_ref.dart/base_collection_reference.dart';
import 'package:e_commerce/src/repositories/firestore/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FavoriteCollectionReference extends BaseCollectionReference<XProduct> {
  FavoriteCollectionReference()
      : super(FirebaseFirestore.instance
            .collection('Favorite')
            .withConverter<XProduct>(
              fromFirestore: (snapshot, _) => XProduct.formDocument(snapshot),
              toFirestore: (userModel, _) => userModel.toJson(),
            ));

  Future<XResult<XProduct>> addProductToFavorite(XProduct product) async {
    try {
      final User? user = AuthService().currentUser;
      if (user != null) {
        ref.doc(user.uid).set(product);
        return XResult.success(product);
      } else {
        return XResult.error('Not login yet');
      }
    } catch (e) {
      return XResult.exception(e);
    }
  }

  Future<XResult<List<XProduct>>> getProductToFavorite() async {
    try {
      final User? user = AuthService().currentUser;
      if (user != null) {
        return query();
      } else {
        return XResult.error('Not login yet');
      }
    } catch (e) {
      return XResult.exception(e);
    }
  }
}
