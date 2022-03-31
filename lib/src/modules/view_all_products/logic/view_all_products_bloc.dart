import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/src/models/handle.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/modules/product/logic/list_products_filter_bloc.dart';
import 'package:e_commerce/src/utils/enum/color_type.dart';
import 'package:e_commerce/src/utils/enum/product_type.dart';
import 'package:e_commerce/src/utils/enum/size_type.dart';
import 'package:e_commerce/src/utils/enum/sort_by.dart';
import 'package:e_commerce/src/utils/enum/view_type.dart';

part 'view_all_products_state.dart';

class ViewAllProductsBloc extends ListProductsFilterBloc<ViewAllProductsState> {
  ViewAllProductsBloc()
      : super(ViewAllProductsState(
            docs: XHandle.initial(),
            listProducts: XHandle.initial(),
            items: XHandle.completed([]),
            searchList: XHandle.completed([])));

  Future<void> getProductViewAll({required ProductType productType}) async {
    var value =
        await domain.product.getProductsFilter(productType: productType);
    if (value.isSuccess) {
      emit(state.copyWithItem(
          listProducts: XHandle.completed(
              _convertToListXProducts(docs: value.data ?? [])),
          docs: XHandle.completed(value.data ?? [])));
    } else {}
  }

  Future<void> loadMore({required ProductType productType}) async {
    emit(state.copyWithItem(isLoadMore: true));
    await Future.delayed(const Duration(seconds: 1));
    var value = await domain.product.getNextProductsFilter(
        documentList: state.docs.data ?? [], productType: productType);
    if (value.isSuccess) {
      (state.docs.data ?? []).addAll(value.data ?? []);

      emit(state.copyWithItem(
          docs: XHandle.completed(state.docs.data ?? []),
          listProducts: XHandle.completed(
              _convertToListXProducts(docs: state.docs.data ?? [])),
          isLoadMore: false));

      if ((value.data ?? []).isEmpty) {
        emit(state.copyWithItem(isLoadMore: false, isEndList: true));
      }
    } else {}
  }

  Future<void> refresh({required ProductType productType}) async {
    var value =
        await domain.product.getProductsFilter(productType: productType);
    emit(state.copyWithItem(
        docs: XHandle.completed(value.data ?? []),
        listProducts:
            XHandle.completed(_convertToListXProducts(docs: value.data ?? [])),
        isEndList: false));
  }

  void restart() {
    emit(state.copyWithItem(
      items: XHandle.initial(),
      docs: XHandle.initial(),
      searchText: '',
      isLoadMore: false,
      isEndList: false,
      sortBy: SortBy.lowToHigh,
      colorType: ColorType.black,
      sizeType: SizeType.xs,
      viewType: ViewType.listView,
    ));
  }

  @override
  Future<void> searchProduct(String query) async {
    late List<XProduct> items;
    if (query.isEmpty || query == '') {
      items = [];
    } else {
      items = (state.listProducts.data ?? []).where((e) {
        final titleLower = e.name.toLowerCase();
        final searchLower = query.toLowerCase();

        return titleLower.contains(searchLower);
      }).toList();
    }

    emit(state.copyWithItem(
        searchList: XHandle.completed(items), searchText: query));
  }

  List<XProduct> _convertToListXProducts(
      {required List<DocumentSnapshot> docs}) {
    List<XProduct> list = docs.map((e) => e.data() as XProduct).toList();
    return list;
  }
}
