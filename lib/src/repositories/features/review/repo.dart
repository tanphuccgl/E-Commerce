import 'package:e_commerce/src/models/result.dart';
import 'package:e_commerce/src/models/review_model.dart';

abstract class ReviewRepository {
  Future<XResult<List<XReview>>> getAllReview();
  Future<XResult<List<XReview>>> setReviews();
  Future<XResult> addYourReview(XReview review);
}
