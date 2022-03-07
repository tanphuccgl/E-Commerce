part of 'product_bloc.dart';

class ProductState extends Equatable {
  final List<XProduct>? items;
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

  final bool isLoading;
  const ProductState({this.items, this.isLoading = true});

  @override
  List<Object?> get props => [items, isLoading];
  ProductState copyWithItem({List<XProduct>? items, bool? isLoading}) {
    return ProductState(
        items: items ?? this.items, isLoading: isLoading ?? this.isLoading);
  }
}
