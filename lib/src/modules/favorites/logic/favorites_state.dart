part of 'favorites_bloc.dart';

class FavoriteState extends ProductState {
  final XHandle<List<XProduct>> listFavorite;
  bool hadFavorites(XProduct product) {
    late bool value = false;
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
      bool isLoading = false,
      required XHandle<List<XProduct>> searchList,
      SortBy sortBy = SortBy.lowToHigh,
      ColorType colorType = ColorType.black,
      SizeType sizeType = SizeType.xs,
      ViewType viewType = ViewType.listView})
      : super(
            items: items,
            isLoading: isLoading,
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
        isLoading
      ];
  @override
  FavoriteState copyWithItem(
      {XHandle<List<XProduct>>? items,
      XHandle<List<XProduct>>? searchList,
      XHandle<List<XProduct>>? listFavorite,
      bool? isLoading,
      String? searchText,
      ViewType? viewType,
      SizeType? sizeType,
      ColorType? colorType,
      SortBy? sortBy}) {
    return FavoriteState(
        listFavorite: listFavorite ?? this.listFavorite,
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
