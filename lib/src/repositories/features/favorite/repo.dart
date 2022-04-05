import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/models/result.dart';

abstract class FavoriteRepository {
  Future<XResult<List<DocumentSnapshot>>> getProductToFavorite();
  Future<XResult<List<DocumentSnapshot>>> getNextProductToFavorite(
      DocumentSnapshot? lastDoc);
  Future<XResult<XProduct>> addProductToFavorite(XProduct product);
  Future<XResult> deleteProductToFavorite(XProduct product);
}
