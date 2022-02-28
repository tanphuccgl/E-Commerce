import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/src/models/categories_model.dart';
import 'package:e_commerce/src/models/result.dart';
import 'package:e_commerce/src/repositories/firestore/collection_ref.dart/base_collection_reference.dart';

class CategoriesCollectionReference
    extends BaseCollectionReference<XCategories> {
  CategoriesCollectionReference()
      : super(FirebaseFirestore.instance
            .collection('Categories')
            .withConverter<XCategories>(
              fromFirestore: (snapshot, _) =>
                  XCategories.formDocument(snapshot),
              toFirestore: (userModel, _) => userModel.toJson(),
            ));
  Future<XResult<List<XCategories>>> getCategories() async {
    try {
      return query();
    } catch (e) {
      return XResult.exception(e);
    }
  }
}
