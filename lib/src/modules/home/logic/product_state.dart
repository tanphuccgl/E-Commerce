part of 'product_bloc.dart';

class ProductState extends Equatable {
  final List<XProduct>? items;
  final bool isLoading;
  const ProductState({this.items, this.isLoading = true});

  @override
  List<Object?> get props => [items, isLoading];
  ProductState copyWithItem({List<XProduct>? items, bool? isLoading}) {
    return ProductState(
        items: items ?? this.items, isLoading: isLoading ?? this.isLoading);
  }
}
