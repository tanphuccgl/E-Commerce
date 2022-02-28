part of 'product_bloc.dart';

class ProductState extends Equatable {
  final List<XProduct>? items;
  const ProductState([this.items]);

  @override
  List<Object?> get props => [items];
  ProductState copyWithItem(List<XProduct> items) {
    return ProductState(items);
  }
}
