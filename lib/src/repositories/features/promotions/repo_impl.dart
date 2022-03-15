import 'package:e_commerce/src/models/promotions_model.dart';
import 'package:e_commerce/src/models/result.dart';
import 'package:e_commerce/src/repositories/features/promotions/repo.dart';
import 'package:e_commerce/src/repositories/firestore/collection_ref.dart/promotions_collection_reference.dart';

class PromotionRepositoryImpl implements PromotionRepository {
  @override
  Future<XResult<List<XPromotion>>> addPromotions() async {
    try {
      var data = PromotionsCollectionReference().addPromotions();
      return data;
    } catch (e) {
      return XResult.error(e.toString());
    }
  }

  @override
  Future<XResult<List<XPromotion>>> getPromotions() async {
    try {
      var data = await PromotionsCollectionReference().getPromotions();
      return data;
    } catch (e) {
      return XResult.error(e.toString());
    }
  }
}
