import 'package:e_commerce/src/models/result.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/repositories/features/cart/repo.dart';
import 'package:e_commerce/src/repositories/firestore/collection_ref.dart/cart_collection_reference.dart';

class CartRepositoryImpl implements CartRepository {
  @override
  Future<XResult<List<XProduct>>> getProductsOfCart() async {
    try {
      var data = await CartCollectionReference().getProductOfCart();
      return data;
    } catch (e) {
      return XResult.error(e.toString());
    }
  }

  @override
  Future<XResult<XProduct>> addToCard(XProduct product) async {
    try {
      var data = CartCollectionReference().addToCart(product);
      return data;
    } catch (e) {
      return XResult.error(e.toString());
    }
  }

  @override
  Future<XResult> deleteToCart(XProduct product) async {
    try {
      CartCollectionReference().deleteProductToCart(product);
      return XResult.success('success');
    } catch (e) {
      return XResult.error(e.toString());
    }
  }
}