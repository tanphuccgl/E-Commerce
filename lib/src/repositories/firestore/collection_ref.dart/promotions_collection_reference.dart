import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/_dev/data_firebase.dart';
import 'package:e_commerce/src/models/promotions_model.dart';
import 'package:e_commerce/src/models/result.dart';
import 'package:e_commerce/src/repositories/firestore/collection_ref.dart/base_collection_reference.dart';

class PromotionsCollectionReference
    extends BaseCollectionReference<XPromotion> {
  PromotionsCollectionReference()
      : super(FirebaseFirestore.instance
            .collection('Promotions')
            .withConverter<XPromotion>(
              fromFirestore: (snapshot, _) => XPromotion.formDocument(snapshot),
              toFirestore: (promotion, _) => promotion.toJson(),
            ));

  Future<XResult<List<XPromotion>>> getPromotions() async {
    return query();
  }

  Future<XResult<List<XPromotion>>> addPromotions() async {
    try {
      var batch = ref.firestore.batch();
      for (int i = 0; i < listPromotions.length; i++) {
        {
          batch.set(ref.doc(listPromotions[i].id), listPromotions[i],
              SetOptions(merge: true));
        }
      }
      batch.commit();
      return XResult.success(listPromotions);
    } catch (e) {
      return XResult.exception(e);
    }
  }
}
