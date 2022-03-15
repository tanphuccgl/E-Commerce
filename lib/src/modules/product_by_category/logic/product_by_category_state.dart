part of 'product_by_category_bloc.dart';

class ProductByCategoryState extends Equatable {
  final ViewType viewType;
  final SortBy sortBy;

  const ProductByCategoryState({
    this.viewType = ViewType.listView,
    this.sortBy = SortBy.lowToHigh,
  });

  @override
  List<Object?> get props => [viewType, sortBy];
  ProductByCategoryState copyWith(
      {String? label,
      ViewType? viewType,
      SortBy? sortBy,
      List<bool>? isSelectedList}) {
    return ProductByCategoryState(
        viewType: viewType ?? this.viewType, sortBy: sortBy ?? this.sortBy);
  }
}

enum ViewType { listView, gridView }

extension ViewTypeExt on ViewType {
  String iconOf() {
    switch (this) {
      case ViewType.listView:
        return MyIcons.listIcon;
      case ViewType.gridView:
        return MyIcons.gridIcon;

      default:
        return "N/A";
    }
  }

  Color backgroundColor() {
    switch (this) {
      case ViewType.gridView:
        return MyColors.colorWhite;
      case ViewType.listView:
        return MyColors.colorBackground2;
      default:
        return MyColors.colorPrimary;
    }
  }
}

enum SortBy {
  popular,
  newest,
  review,
  lowToHigh,
  highToLow,
}

extension SortByExt on SortBy {
  String value() {
    switch (this) {
      case SortBy.popular:
        return "Popular";
      case SortBy.newest:
        return "Newest";
      case SortBy.review:
        return "Customer review";
      case SortBy.lowToHigh:
        return "Price: lowest to high";
      case SortBy.highToLow:
        return "Price: highest to low";

      default:
        return "N/A";
    }
  }

  bool sortProductBy(SortBy value) {
    return value == this ? true : false;
  }

  TextStyle styleOf(bool isSelected) {
    switch (isSelected) {
      case true:
        return const TextStyle(
            fontSize: 16,
            height: 1,
            color: MyColors.colorWhite,
            fontWeight: FontWeight.w600);
      case false:
        return const TextStyle(
            fontSize: 16,
            height: 1,
            color: MyColors.colorBlack,
            fontWeight: FontWeight.normal);

      default:
        return const TextStyle();
    }
  }
}
