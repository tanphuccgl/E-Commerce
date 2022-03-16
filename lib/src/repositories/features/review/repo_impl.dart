import 'package:e_commerce/src/models/result.dart';
import 'package:e_commerce/src/models/review_model.dart';
import 'package:e_commerce/src/repositories/features/review/repo.dart';
import 'package:e_commerce/src/repositories/firestore/collection_ref.dart/review_collection_reference.dart';

class ReviewRepositoryImpl implements ReviewRepository {
  @override
  Future<XResult<List<XReview>>> getAllReview() async {
    try {
      var data = await ReviewCollectionReference().getAllReview();
      return data;
    } catch (e) {
      return XResult.error(e.toString());
    }
  }

  @override
  Future<XResult<List<XReview>>> setReviews() async {
    try {
      var data = ReviewCollectionReference().setReviews();
      return data;
    } catch (e) {
      return XResult.error(e.toString());
    }
  }

  @override
  Future<XResult> addYourReview(XReview review) async {
    try {
      ReviewCollectionReference().addYourReview(review);
      return XResult.success('success');
    } catch (e) {
      return XResult.error(e.toString());
    }
  }
}
