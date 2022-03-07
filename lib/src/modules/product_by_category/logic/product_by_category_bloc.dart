import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_by_category_state.dart';

class ProductByCategoryBloc extends Cubit<ProductByCategoryState> {
  ProductByCategoryBloc()
      : super(const ProductByCategoryState(
            isSelectedList: [false, false, false, true, false]));

  void sortBy(int index) {
    List<bool> items = [false, false, false, false, false];
    state.isSelectedList[index] = true;

    items.replaceRange(index, index + 1, [true]);
    emit(state.copyWith(sortBy: SortBy.values[index], isSelectedList: items));
  }

  void changeViewType() {
    emit(state.copyWith(isListViewType: !state.isListViewType));
  }
}
