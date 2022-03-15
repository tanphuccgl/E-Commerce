import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/constants/my_icons.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_by_category_state.dart';

class ProductByCategoryBloc extends Cubit<ProductByCategoryState> {
  ProductByCategoryBloc() : super(const ProductByCategoryState());

  void sortBy(int index) {
    emit(state.copyWith(sortBy: SortBy.values[index]));
  }

  void changeViewType() {
    var viewType = state.viewType == ViewType.listView
        ? ViewType.gridView
        : ViewType.listView;
    emit(state.copyWith(viewType: viewType));
  }
}
