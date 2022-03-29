import 'package:e_commerce/src/models/result.dart';
import 'package:e_commerce/src/modules/favorites/logic/favorites_bloc.dart';
import 'package:e_commerce/src/widgets/paginate/handle_paginate.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/widgets/paginate/logic/paginate_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'paginate_favorites_state.dart';

class PaginateFavoritesBloc extends PaginateBloc<PaginateFavoritesState> {
  PaginateFavoritesBloc()
      : super(PaginateFavoritesState(
            items: XHandlePaginate.completed([]),
            listFavorites: XHandlePaginate.completed([])));

  @override
  Future<void> getItems({required List<XProduct> list}) async {
    await Future.delayed(const Duration(seconds: 1));
    XHandlePaginate handle = XHandlePaginate.result(XResult.success(list));

    if (handle.isInitial || handle.isLoading) {
      emit(state.copyWith(paginationStatus: PaginationStatus.loading));
    } else if (handle.isLoader) {
      if (handle.data.isEmpty) {
        emit(state.copyWith(paginationStatus: PaginationStatus.empty));
      } else {
        emit(state.copyWith(paginationStatus: PaginationStatus.loader));
      }
    } else {
      emit(state.copyWith(paginationStatus: PaginationStatus.error));
    }
    emit(state.copyWith(listFavorites: XHandlePaginate.completed(handle.data)));
  }

  @override
  void loadMore(BuildContext context) {
    emit(state.copyWith(isLoadingMore: true));
    context
        .read<FavoriteBloc>()
        .getProduct()
        .then((value) => emit(state.copyWith(isLoadingMore: false)));
  }

  @override
  void refreshPaginatedList({required List<XProduct> list}) {
    emit(state.copyWith(isRefresh: true));
    getItems(list: list)
        .then((value) => emit(state.copyWith(isRefresh: false)));
  }
}
