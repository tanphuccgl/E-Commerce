import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/_dev/data_firebase.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/models/result.dart';
import 'package:e_commerce/src/repositories/firestore/collection_ref.dart/base_collection_reference.dart';

class ProductCollectionReference extends BaseCollectionReference<XProduct> {
  ProductCollectionReference()
      : super(FirebaseFirestore.instance
            .collection('Product')
            .withConverter<XProduct>(
              fromFirestore: (snapshot, _) => XProduct.formDocument(snapshot),
              toFirestore: (userModel, _) => userModel.toJson(),
            ));

  Future<XResult<List<XProduct>>> getProduct() async {
    try {
      return query();
    } catch (e) {
      return XResult.exception(e);
    }
  }

  Future<XResult<List<XProduct>>> updateProduct() async {
    try {
      var batch = ref.firestore.batch();
      for (int i = 0; i < listProduct.length; i++) {
        {
          batch.set(ref.doc(listProduct[i].id), listProduct[i],
              SetOptions(merge: true));
        }
      }
      batch.commit();
      return XResult.success(listProduct);
    } catch (e) {
      return XResult.exception(e);
    }
  }
}
