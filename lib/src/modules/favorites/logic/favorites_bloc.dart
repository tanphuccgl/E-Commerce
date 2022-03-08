import 'package:e_commerce/src/models/handle.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/modules/product_by_category/logic/product_by_category_bloc.dart';
import 'package:e_commerce/src/repositories/domain.dart';
import 'package:e_commerce/src/repositories/firestore/services/auth_service.dart';
import 'package:e_commerce/src/widgets/snackbar/snackbar.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'favorites_state.dart';

class FavoriteBloc extends Cubit<FavoriteState> {
  FavoriteBloc() : super(FavoriteState(favoriteList: XHandle.completed([]))) {
    getProduct();
  }
  final Domain domain = Domain();

  Future<void> getProduct() async {
    User? currentUser = AuthService().currentUser;
 // TODO:  error - khi logout vẫn giữ list hiện tại, reload mới mất
    final value = await domain.favorite.getProductToFavorite();
    if (value.isSuccess) {
      List<XProduct> items = [...(state.favoriteList.data ?? [])];
      items = (value.data ?? [])
          .where((e) => e.idUser == currentUser?.uid)
          .toList();
      emit(state.copyWithItem(favoriteList: XHandle.completed(items)));
    } else {}
  }

  Future<void> addProduct(XProduct product) async {
    final value = await domain.favorite.addProductToFavorite(product);
    if (value.isSuccess) {
      final List<XProduct> items = [
        ...(state.favoriteList.data ?? []),
        product
      ];

      emit(state.copyWithItem(favoriteList: XHandle.completed(items)));
      XSnackBar.show(msg: 'Favorite success');
    } else {
      XSnackBar.show(msg: 'Favorite failure');
    }
  }

  Future<void> removeProduct(XProduct product) async {
    final value = await domain.favorite.deleteProductToFavorite(product);
    if (value.isSuccess) {
      final List<XProduct> items = [...(state.favoriteList.data ?? [])];
      items.remove(product);

      emit(state.copyWithItem(favoriteList: XHandle.completed(items)));
      XSnackBar.show(msg: 'Remove Product success');
    } else {
      XSnackBar.show(msg: 'Remove Product failure');
    }
  }

  void sortBy(int index) {
    emit(state.copyWithItem(
      sortBy: SortBy.values[index],
    ));
  }

  void changeViewType() {
    var viewType = state.viewType == ViewType.listView
        ? ViewType.gridView
        : ViewType.listView;
    emit(state.copyWithItem(viewType: viewType));
  }
}
