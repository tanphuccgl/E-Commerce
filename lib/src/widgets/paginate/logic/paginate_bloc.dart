import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/models/result.dart';
import 'package:e_commerce/src/widgets/paginate/handle_paginate.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'paginate_state.dart';

class PaginateBloc<T extends PaginateState> extends Cubit<T> {
  PaginateBloc(T initialState) : super(initialState);

  void getItems({required List<XProduct> list}) {
    List<XProduct> items = [...(list)];

    XHandlePaginate handle = XHandlePaginate.result(XResult.success(items));

    if (handle.isInitial || handle.isLoading) {
      emit(state.copyWith(paginationStatus: PaginationStatus.loading) as T);
    } else if (handle.isLoader) {
      if (list.isEmpty) {
        emit(state.copyWith(paginationStatus: PaginationStatus.empty) as T);
      } else {
        emit(state.copyWith(paginationStatus: PaginationStatus.loader) as T);
      }
    } else {
      emit(state.copyWith(paginationStatus: PaginationStatus.error) as T);
    }
    emit(state.copyWith(items: XHandlePaginate.completed(items)) as T);
  }

  void loadMore(BuildContext context) {
    emit(state.copyWith(isLoadingMore: true) as T);
  }

  void refreshPaginatedList({required List<XProduct> list}) {
    emit(state.copyWith(isRefresh: true) as T);
  }
}
