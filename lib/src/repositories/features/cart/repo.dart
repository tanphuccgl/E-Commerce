import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/models/result.dart';

abstract class CartRepository {
  Future<XResult<List<XProduct>>> getProductsOfCart();
  Future<XResult<XProduct>> addToCard(XProduct product);
  Future<XResult> deleteToCart(XProduct product);
}
