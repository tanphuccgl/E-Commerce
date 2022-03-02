part of 'product_by_category_bloc.dart';

class ProductByCategoryState extends Equatable {
  final String label;
  final bool isListViewType;
  final bool lowestToHigh;
  final bool highestToLow;
  const ProductByCategoryState(
      {this.label = 'Price: lowest to high',
      this.isListViewType = true,
      this.lowestToHigh = true,
      this.highestToLow = false});

  @override
  List<Object?> get props =>
      [label, isListViewType, lowestToHigh, highestToLow];
  ProductByCategoryState copyWith(
      {String? label,
      bool? isListViewType,
      bool? lowestToHigh,
      bool? highestToLow}) {
        
    return ProductByCategoryState(
        label: label ?? this.label,
        isListViewType: isListViewType ?? this.isListViewType,
        lowestToHigh: lowestToHigh ?? this.lowestToHigh,
        highestToLow: highestToLow ?? this.highestToLow);
  }
}
