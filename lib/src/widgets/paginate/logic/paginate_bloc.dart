import 'package:e_commerce/src/models/result.dart';
import 'package:e_commerce/src/widgets/paginate/handle_paginate.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'paginate_state.dart';

class PaginateBloc extends Cubit<PaginateState> {
  PaginateBloc() : super(PaginateState(items: XHandlePaginate.loader([])));
//TODO
  void getItems({required List items}) {
    XHandlePaginate handle = XHandlePaginate.result(XResult.error('aja'));
    if (handle.isInitial) {
      changeStatePagination(paginationStatus: PaginationStatus.loading);
    } else if (handle.isLoading) {
      changeStatePagination(paginationStatus: PaginationStatus.loading);
    } else if (handle.isLoader) {
      if (items.isEmpty) {
        changeStatePagination(paginationStatus: PaginationStatus.empty);
      } else {
        changeStatePagination(paginationStatus: PaginationStatus.loader);
      }
    } else {
      changeStatePagination(paginationStatus: PaginationStatus.error);
    }
  }

  void changeStatePagination({required PaginationStatus paginationStatus}) {
    emit(state.copyWith(paginationStatus: paginationStatus));
  }

  void loadMore() {
    emit(state.copyWith(isLoadingMore: true));
  }

  void refreshPaginatedList() {
    emit(state.copyWith(isRefresh: true));
  }
}
