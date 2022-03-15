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
    emit(state.copyWithItem(isLoading: true));

    final product = await domain.product.getProduct();
    if (product.isSuccess) {
      emit(state.copyWithItem(items: product.data ?? [], isLoading: false));
    }
  }

  Future<void> addProduct() async {
    final product = await domain.product.addProduct();

    emit(state.copyWithItem(items: product.data ?? [], isLoading: false));
  }

  Future<void> searchProduct(String query) async {
    late List<XProduct> items;
    if (query.isEmpty || query == '') {
      items = [];
    } else {
      items = (state.items ?? []).where((e) {
        final titleLower = e.name.toLowerCase();
        final searchLower = query.toLowerCase();

        return titleLower.contains(searchLower);
      }).toList();
    }

    emit(state.copyWithItem(searchList: items, searchText: query));
  }
}
