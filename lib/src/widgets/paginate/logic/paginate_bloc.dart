import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/repositories/domain.dart';
import 'package:e_commerce/src/repositories/firestore/services/auth_service.dart';
import 'package:e_commerce/src/widgets/paginate/paginate.dart';
import 'package:e_commerce/src/widgets/snackbar/snackbar.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'paginate_state.dart';

class PaginateBloc extends Cubit<PaginateState> {
  PaginateBloc(PaginateState initialState) : super(initialState);

  Domain domain = Domain();

  Future<void> fetchFirstData() async {
    var value = await domain.favorite.getProductToFavorite();
    if (value.isSuccess) {
      final listDocs = value.data ?? [];
      emit(state.copyWithItem(
        docs: XPaginate.completed(listDocs),
      ));
    } else {
      XSnackBar.show(msg: 'Page load failed');
    }
  }

  Future<void> fetchNextData() async {
    emit(state.copyWithItem(isLoadMore: true));
    await Future.delayed(const Duration(seconds: 1));
    final currentListDocs = state.docs.data ?? [];
    var value = await domain.favorite.getNextProductToFavorite(currentListDocs);
    if (value.isSuccess) {
      final listDocs = value.data ?? [];
      listDocs.isEmpty
          ? XSnackBar.show(msg: 'End of List')
          : currentListDocs.addAll(listDocs);

      emit(state.copyWithItem(
          docs: XPaginate.completed(currentListDocs), isLoadMore: false));
    } else {
      XSnackBar.show(msg: 'Fetch Next Page Failed');
    }
  }
}
