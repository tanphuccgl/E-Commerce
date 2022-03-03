part of 'product_by_category_bloc.dart';

class ProductByCategoryState extends Equatable {
  final bool isListViewType;
  final SortBy sortBy;
  const ProductByCategoryState(
      {this.isListViewType = true, this.sortBy = SortBy.lowToHigh});

  @override
  List<Object?> get props => [isListViewType, sortBy];
  ProductByCategoryState copyWith(
      {String? label, bool? isListViewType, SortBy? sortBy}) {
    return ProductByCategoryState(
        isListViewType: isListViewType ?? this.isListViewType,
        sortBy: sortBy ?? this.sortBy);
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
}
