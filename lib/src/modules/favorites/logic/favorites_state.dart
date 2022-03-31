part of 'favorites_bloc.dart';

class FavoriteState extends ListProductsFilterState {
  final XHandle<List<XProduct>> listFavorite;
  final XHandle<List<DocumentSnapshot>> docs;
  final bool isLoadMore;
  final bool isEndList;
  bool hadFavorites(XProduct product) {
    bool value = false;
    for (var item in listFavorite.data ?? []) {
      if (item.id == product.id) {
        value = true;
        break;
      } else {
        value = false;
      }
    }
    return value;
  }

  const FavoriteState(
      {required XHandle<List<XProduct>> items,
      required this.listFavorite,
      String searchText = '',
      required this.docs,
      this.isLoadMore = false,
      this.isEndList = false,
      required XHandle<List<XProduct>> searchList,
      SortBy sortBy = SortBy.lowToHigh,
      ColorType colorType = ColorType.black,
      SizeType sizeType = SizeType.xs,
      ViewType viewType = ViewType.listView})
      : super(
            items: items,
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
        listFavorite,
        docs,
        isLoadMore,
        isEndList
      ];
  @override
  FavoriteState copyWithItem(
      {XHandle<List<XProduct>>? items,
      XHandle<List<XProduct>>? searchList,
      XHandle<List<XProduct>>? listFavorite,
      String? searchText,
      ViewType? viewType,
      SizeType? sizeType,
      ColorType? colorType,
      XHandle<List<DocumentSnapshot>>? docs,
      bool? isLoadMore,
      bool? isEndList,
      SortBy? sortBy}) {
    return FavoriteState(
        listFavorite: listFavorite ?? this.listFavorite,
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
