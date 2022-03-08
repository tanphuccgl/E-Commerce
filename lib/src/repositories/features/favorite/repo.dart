import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/models/result.dart';

abstract class FavoriteRepository {
  Future<XResult<List<XProduct>>> getProductToFavorite();
  Future<XResult<XProduct>> addProductToFavorite(XProduct product);
    Future<XResult> deleteProductToFavorite(XProduct product);

}
