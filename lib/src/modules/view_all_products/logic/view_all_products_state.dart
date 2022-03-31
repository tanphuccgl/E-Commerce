part of 'view_all_products_bloc.dart';

class ViewAllProductsState extends ListProductsFilterState {
  final XHandle<List<XProduct>> listProducts;

  const ViewAllProductsState(
      {required XHandle<List<XProduct>> items,
      required this.listProducts,
      String searchText = '',
      required XHandle<List<DocumentSnapshot>> docs,
      bool isLoadMore = false,
      bool isEndList = false,
      required XHandle<List<XProduct>> searchList,
      SortBy sortBy = SortBy.lowToHigh,
      ColorType colorType = ColorType.black,
      SizeType sizeType = SizeType.xs,
      ViewType viewType = ViewType.listView})
      : super(
            items: items,
            docs: docs,
            isEndList: isEndList,
            isLoadMore: isLoadMore,
            colorType: colorType,
            searchList: searchList,
            searchText: searchText,
            sizeType: sizeType,
            sortBy: sortBy,
            viewType: viewType);

  @override
  List<Object?> get props => [
        items.data,
        sortBy,
        viewType,
        sizeType,
        searchList,
        searchText,
        listProducts,
        docs,
        isLoadMore,
        isEndList
      ];
  @override
  ViewAllProductsState copyWithItem(
      {XHandle<List<XProduct>>? items,
      XHandle<List<XProduct>>? searchList,
      XHandle<List<XProduct>>? listProducts,
      String? searchText,
      ViewType? viewType,
      SizeType? sizeType,
      ColorType? colorType,
      XHandle<List<DocumentSnapshot>>? docs,
      bool? isLoadMore,
      bool? isEndList,
      SortBy? sortBy}) {
    return ViewAllProductsState(
        listProducts: listProducts ?? this.listProducts,
        searchList: searchList ?? this.searchList,
        searchText: searchText ?? this.searchText,
        items: items ?? this.items,
        sizeType: sizeType ?? this.sizeType,
        sortBy: sortBy ?? this.sortBy,
        viewType: viewType ?? this.viewType,
        colorType: colorType ?? this.colorType,
        docs: docs ?? this.docs,
        isEndList: isEndList ?? this.isEndList,
        isLoadMore: isLoadMore ?? this.isLoadMore);
  }
}
