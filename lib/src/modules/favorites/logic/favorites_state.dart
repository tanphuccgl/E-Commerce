part of 'favorites_bloc.dart';

class FavoriteState extends Equatable {
  final ViewType viewType;
  final SortBy sortBy;
  final SizeType sizeType;
  final XHandle<List<XProduct>> searchList;
  final String searchText;

  final XHandle<List<XProduct>> favoriteList;
  bool hadFavorites(
    XProduct product,
  ) {
    late bool value = false;
    for (var item in favoriteList.data ?? []) {
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
      this.searchText = '',
      required this.searchList,
      this.sortBy = SortBy.lowToHigh,
      this.sizeType = SizeType.xs,
      this.viewType = ViewType.listView});

  @override
  List<Object?> get props =>
      [favoriteList.data, sortBy, viewType, sizeType, searchList, searchText];
  FavoriteState copyWithItem(
      {XHandle<List<XProduct>>? favoriteList,
      XHandle<List<XProduct>>? searchList,
      String? searchText,
      ViewType? viewType,
      SizeType? sizeType,
      SortBy? sortBy}) {
    return FavoriteState(
        searchList: searchList ?? this.searchList,
        searchText: searchText ?? this.searchText,
        favoriteList: favoriteList ?? this.favoriteList,
        sizeType: sizeType ?? this.sizeType,
        sortBy: sortBy ?? this.sortBy,
        viewType: viewType ?? this.viewType);
  }
}

enum SizeType { xs, s, m, l, xl }

extension SizeTypeExt on SizeType {
  String value() {
    switch (this) {
      case SizeType.xs:
        return "XS";
      case SizeType.s:
        return "S";
      case SizeType.m:
        return "M";
      case SizeType.l:
        return "L";
      case SizeType.xl:
        return "XL";

      default:
        return "N/A";
    }
  }

  bool selectedSize(SizeType value) {
    return value == this ? true : false;
  }

  TextStyle styleOf(bool isSelected) {
    switch (isSelected) {
      case true:
        return const TextStyle(
            fontSize: 16,
            height: 1,
            color: MyColors.colorWhite,
            fontWeight: FontWeight.w500);
      case false:
        return const TextStyle(
            height: 1.42,
            fontSize: 14,
            color: MyColors.colorBlack,
            fontWeight: FontWeight.w500);

      default:
        return const TextStyle();
    }
  }

  ButtonStyle styleElevatedOf(bool isSelected) {
    switch (isSelected) {
      case true:
        return ElevatedButton.styleFrom(
            primary: MyColors.colorPrimary,
            onPrimary: MyColors.colorWhite,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: const BorderSide(
                    color: MyColors.colorPrimary, width: 0.4)));
      case false:
        return ElevatedButton.styleFrom(
            primary: MyColors.colorWhite,
            onPrimary: MyColors.colorPrimary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: const BorderSide(color: MyColors.colorGray, width: 0.4)));

      default:
        return ElevatedButton.styleFrom();
    }
  }
}
