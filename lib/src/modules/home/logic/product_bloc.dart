import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/repositories/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_state.dart';

class ProductBloc extends Cubit<ProductState> {
  ProductBloc() : super(const ProductState()) {
    getProduct();
  }
  final Domain domain = Domain();

  Future<void> getProduct() async {
    final product = await domain.product.getProduct();
    emit(state.copyWithItem(product.data ?? []));
  }
}
