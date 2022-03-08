part of 'favorites_bloc.dart';

class FavoriteState extends Equatable {
  final ViewType viewType;
  final SortBy sortBy;
  final XHandle<List<XProduct>> favoriteList;
  bool hadFavorites(XProduct product,) {
    late bool value = false;
    for (var item in favoriteList.data??[]) {
  
      if (item.id == product.id) {
        value = true;
        break;
      } else {
        value = false;
      }
    }
    return value;
  }

  void sortList({List<XProduct>? items, int index = 3}) {
    switch (index) {
      case 0:
        break;
      case 1:
        items?.sort((a, b) {
          int item1 = (a.newProduct ?? true) ? 1 : 0;
          int item2 = (b.newProduct ?? true) ? 1 : 0;

          return item2.compareTo(item1);
        });
        break;
      case 2:
        items?.sort((a, b) {
          int item1 = a.star;
          int item2 = b.star;

          return item2.compareTo(item1);
        });

        break;
      case 3:
        items?.sort((a, b) {
          double item1 = (a.currentPrice ?? -1) > 0
              ? (a.currentPrice ?? -1)
              : (a.originalPrice);
          double item2 = (b.currentPrice ?? -1) > 0
              ? (b.currentPrice ?? -1)
              : (b.originalPrice);

          return item1.compareTo(item2);
        });
        break;
      case 4:
        items?.sort((a, b) {
          double item1 = (a.currentPrice ?? -1) > 0
              ? (a.currentPrice ?? -1)
              : (a.originalPrice);
          double item2 = (b.currentPrice ?? -1) > 0
              ? (b.currentPrice ?? -1)
              : (b.originalPrice);

          return item2.compareTo(item1);
        });
        break;
      default:
    }
  }

  const FavoriteState(
      {required this.favoriteList,
      this.sortBy = SortBy.lowToHigh,
      this.viewType = ViewType.listView});

  @override
  List<Object?> get props => [favoriteList, sortBy, viewType];
  FavoriteState copyWithItem(
      {XHandle<List<XProduct>>? favoriteList,
      ViewType? viewType,
      SortBy? sortBy}) {
    return FavoriteState(
        favoriteList: favoriteList ?? this.favoriteList,
        sortBy: sortBy ?? this.sortBy,
        viewType: viewType ?? this.viewType);
  }
}
