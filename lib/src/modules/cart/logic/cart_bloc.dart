import 'package:e_commerce/src/config/routes/coordinator.dart';
import 'package:e_commerce/src/models/handle.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/modules/product/logic/product_bloc.dart';
import 'package:e_commerce/src/repositories/firestore/services/auth_service.dart';
import 'package:e_commerce/src/utils/enum/color_type.dart';
import 'package:e_commerce/src/utils/enum/size_type.dart';
import 'package:e_commerce/src/utils/enum/sort_by.dart';
import 'package:e_commerce/src/utils/enum/view_type.dart';
import 'package:e_commerce/src/widgets/snackbar/snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

part 'cart_state.dart';

class CartBloc extends ProductBloc<CartState> {
  CartBloc()
      : super(CartState(
            productsOfCart: XHandle.completed([]),
            items: XHandle.completed([]),
            searchList: XHandle.completed([]))) {
    getProduct();
  }

  @override
  Future<void> getProduct() async {
    User? currentUser = AuthService().currentUser;
    final value = await domain.cart.getProductsOfCart();
    if (value.isSuccess) {
      List<XProduct> items = [...(state.productsOfCart.data ?? [])];
      items = (value.data ?? [])
          .where((e) => e.idUser == currentUser?.uid)
          .toList();
      emit(state.copyWithItem(productsOfCart: XHandle.completed(items)));
    } else {}
  }

  Future<void> addToCart(BuildContext context,
      {required XProduct product, required SizeType sizeType}) async {
    XProduct xProduct = XProduct(
      color: product.color,
      currentPrice: product.currentPrice,
      discount: product.discount,
      id: product.id,
      idCategory: product.idCategory,
      idUser: product.idUser,
      image: product.image,
      name: product.name,
      nameCategory: product.nameCategory,
      newProduct: product.newProduct,
      originalPrice: product.originalPrice,
      size: sizeType.value(),
      star: product.star,
      type: product.type,
      soldOut: product.soldOut,
    );
    final value = await domain.cart.addToCard(xProduct);
    if (value.isSuccess) {
      final List<XProduct> items = [
        ...(state.productsOfCart.data ?? []),
        xProduct
      ];

      emit(state.copyWithItem(productsOfCart: XHandle.completed(items)));
      XSnackBar.show(msg: 'Add to cart success');
      XCoordinator.pop(context);
    } else {
      XSnackBar.show(msg: 'Add to cart failure');
    }
  }

  Future<void> removeProductToCart(XProduct product) async {
    final value = await domain.cart.deleteToCart(product);
    if (value.isSuccess) {
      final List<XProduct> items = [...(state.productsOfCart.data ?? [])];
      items.remove(product);

      emit(state.copyWithItem(productsOfCart: XHandle.completed(items)));
      XSnackBar.show(msg: 'Remove product to cart success');
    } else {
      XSnackBar.show(msg: 'Remove product to cart failure');
    }
  }

  @override
  Future<void> searchProduct(String query) async {
    late List<XProduct> items;
    if (query.isEmpty || query == '') {
      items = [];
    } else {
      items = (state.productsOfCart.data ?? []).where((e) {
        final titleLower = e.name.toLowerCase();
        final searchLower = query.toLowerCase();

        return titleLower.contains(searchLower);
      }).toList();
    }

    emit(state.copyWithItem(
        searchList: XHandle.completed(items), searchText: query));
  }
}
