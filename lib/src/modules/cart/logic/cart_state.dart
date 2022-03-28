part of 'cart_bloc.dart';

class CartState extends ListProductsFilterState {
  final XHandle<List<XProduct>> productsOfCart;
  String priceProduct(XProduct data) => data.discount == 0.0
      ? XUtils.formatPrice(data.originalPrice)
      : XUtils.formatPrice(data.currentPrice ?? -1);

  double totalPrice({required double promoCode}) {
    double total = 0;
    List<XProduct> items = productsOfCart.data ?? [];
    for (int i = 0; i < items.length; i++) {
      total = total + items[i].amount * double.parse(priceProduct(items[i]));
    }
    return total - total * promoCode / 100;
  }

  bool hadCart(XProduct product) {
    bool value = false;
    for (var item in productsOfCart.data ?? []) {
      if (item.id == product.id) {
        value = true;
        break;
      } else {
        value = false;
      }
    }
    return value;
  }

  const CartState(
      {required XHandle<List<XProduct>> items,
      required this.productsOfCart,
      String searchText = '',
      bool isLoading = false,
      required XHandle<List<XProduct>> searchList,
      SortBy sortBy = SortBy.lowToHigh,
      SizeType sizeType = SizeType.xs,
      ColorType colorType = ColorType.black,
      ViewType viewType = ViewType.listView})
      : super(
            items: items,
            isLoading: isLoading,
            searchList: searchList,
            searchText: searchText,
            sizeType: sizeType,
            colorType: colorType,
            sortBy: sortBy,
            viewType: viewType);

  @override
  List<Object?> get props => [
        items,
        sortBy,
        viewType,
        sizeType,
        searchList,
        colorType,
        searchText,
        productsOfCart,
        isLoading,
      ];
  @override
  CartState copyWithItem(
      {XHandle<List<XProduct>>? items,
      bool? isLoading,
      XHandle<List<XProduct>>? searchList,
      XHandle<List<XProduct>>? productsOfCart,
      String? searchText,
      ViewType? viewType,
      ColorType? colorType,
      SizeType? sizeType,
      SortBy? sortBy}) {
    return CartState(
        productsOfCart: productsOfCart ?? this.productsOfCart,
        isLoading: isLoading ?? this.isLoading,
        searchList: searchList ?? this.searchList,
        searchText: searchText ?? this.searchText,
        items: items ?? this.items,
        sizeType: sizeType ?? this.sizeType,
        sortBy: sortBy ?? this.sortBy,
        viewType: viewType ?? this.viewType,
        colorType: colorType ?? this.colorType);
  }
}
