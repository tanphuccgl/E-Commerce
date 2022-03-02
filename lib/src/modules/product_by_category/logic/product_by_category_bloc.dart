import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_by_category_state.dart';

class ProductByCategoryBloc extends Cubit<ProductByCategoryState> {
  ProductByCategoryBloc()
      : super(const ProductByCategoryState(label: 'Price: lowest to high'));

  void sortBy({required String label}) {
    if (label == 'Price: highest to low') {
      emit(state.copyWith(
          label: label, lowestToHigh: false, highestToLow: true));
    } else {
      emit(state.copyWith(
          label: label, lowestToHigh: true, highestToLow: false));
    }
  }

  void changeViewType() {
    emit(state.copyWith(isListViewType: !state.isListViewType));
  }
}
