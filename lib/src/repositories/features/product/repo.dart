import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/models/result.dart';

abstract class ProductRepository {
  Future<XResult<List<XProduct>>> getProduct();

  Future<XResult<List<XProduct>>> addProduct();
}
