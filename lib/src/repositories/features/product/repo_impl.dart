import 'package:e_commerce/src/models/result.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/repositories/features/product/repo.dart';
import 'package:e_commerce/src/repositories/firestore/collection_ref.dart/products_collection_reference.dart';

class ProductRepositoryImpl implements ProductRepository {
  @override
  Future<XResult<List<XProduct>>> getProduct() async {
    try {
      var data = await ProductCollectionReference().getProduct();
      return data;
    } catch (e) {
      return XResult.error(e.toString());
    }
  }
}
