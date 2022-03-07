part of 'product_bloc.dart';

class ProductState extends Equatable {
  final List<XProduct>? items;
  final List<XProduct>? searchList;
  final bool isLoading;
  final String searchText;
  const ProductState(
      {this.items,
      this.isLoading = true,
      this.searchList,
      this.searchText = ''});

  @override
  List<Object?> get props => [items, isLoading, searchList, searchText];
  ProductState copyWithItem(
      {List<XProduct>? items,
      bool? isLoading,
      List<XProduct>? searchList,
      String? searchText}) {
    return ProductState(
        items: items ?? this.items,
        searchText: searchText ?? this.searchText,
        isLoading: isLoading ?? this.isLoading,
        searchList: searchList ?? this.searchList);
  }
}
