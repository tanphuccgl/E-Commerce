import 'package:e_commerce/src/models/result.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/repositories/features/favorite/repo.dart';
import 'package:e_commerce/src/repositories/firestore/collection_ref.dart/favorite_collection_reference.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  @override
  Future<XResult<List<XProduct>>> getProductToFavorite() async {
    try {
      var data = await FavoriteCollectionReference().getProductToFavorite();
      return data;
    } catch (e) {
      return XResult.error(e.toString());
    }
  }

  @override
  Future<XResult<XProduct>> addProductToFavorite(XProduct product) async {
    try {
      var data = FavoriteCollectionReference().addProductToFavorite(product);
      return data;
    } catch (e) {
      return XResult.error(e.toString());
    }
  }
}