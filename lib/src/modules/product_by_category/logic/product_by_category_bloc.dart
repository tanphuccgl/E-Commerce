import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_by_category_state.dart';

class ProductByCategoryBloc extends Cubit<ProductByCategoryState> {
  ProductByCategoryBloc() : super(const ProductByCategoryState());

  void sortBy(int index) {
    
    emit(state.copyWith(sortBy: SortBy.values[index]));
  }

  void changeViewType() {
    emit(state.copyWith(isListViewType: !state.isListViewType));
  }
}
