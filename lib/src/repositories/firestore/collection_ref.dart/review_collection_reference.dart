import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/_dev/data_firebase.dart';
import 'package:e_commerce/src/models/result.dart';
import 'package:e_commerce/src/models/review_model.dart';
import 'package:e_commerce/src/repositories/firestore/collection_ref.dart/base_collection_reference.dart';
import 'package:e_commerce/src/repositories/firestore/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ReviewCollectionReference extends BaseCollectionReference<XReview> {
  ReviewCollectionReference()
      : super(FirebaseFirestore.instance
            .collection('Reviews')
            .withConverter<XReview>(
              fromFirestore: (snapshot, _) => XReview.formDocument(snapshot),
              toFirestore: (review, _) => review.toJson(),
            ));

  Future<XResult<List<XReview>>> getAllReview() async {
    try {
      return query();
    } catch (e) {
      return XResult.exception(e);
    }
  }

  Future<XResult<List<XReview>>> setReviews() async {
    try {
      var batch = ref.firestore.batch();
      for (int i = 0; i < listReviews.length; i++) {
        {
          batch.set(ref.doc(listReviews[i].id), listReviews[i],
              SetOptions(merge: true));
        }
      }
      batch.commit();
      return XResult.success(listReviews);
    } catch (e) {
      return XResult.exception(e);
    }
  }

  Future<XResult<XReview>> addYourReview(XReview review) async {
    try {
      final User? user = AuthService().currentUser;
      if (user != null) {
        String idDocs = review.id + user.uid;

        ref.doc(idDocs).set(review);

        return XResult.success(review);
      } else {
        return XResult.error('Not login yet');
      }
    } catch (e) {
      return XResult.exception(e);
    }
  }
}
