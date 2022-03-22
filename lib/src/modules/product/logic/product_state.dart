part of 'product_bloc.dart';

// TODO: đổi tên cho hợp lý hơn.
class ProductState extends Equatable {
  final XHandle<List<XProduct>> items;
  final XHandle<List<XProduct>> searchList;
  final String searchText;

  final ViewType viewType;
  final SortBy sortBy;
  final SizeType sizeType;
  final ColorType colorType;

  const ProductState(
      {required this.items,
      this.colorType = ColorType.black,
      this.sortBy = SortBy.lowToHigh,
      this.viewType = ViewType.listView,
      this.sizeType = SizeType.xs,
      required this.searchList,
      this.searchText = ''});

  @override
  List<Object?> get props =>
      [items, searchList, searchText, sortBy, sizeType, viewType, colorType];
  ProductState copyWithItem(
      {XHandle<List<XProduct>>? items,
      XHandle<List<XProduct>>? searchList,
      SortBy? sortBy,
      ViewType? viewType,
      SizeType? sizeType,
      ColorType? colorType,
      String? searchText}) {
    return ProductState(
        items: items ?? this.items,
        searchText: searchText ?? this.searchText,
        searchList: searchList ?? this.searchList,
        sortBy: sortBy ?? this.sortBy,
        viewType: viewType ?? this.viewType,
        sizeType: sizeType ?? this.sizeType,
        colorType: colorType ?? this.colorType);
  }
}
