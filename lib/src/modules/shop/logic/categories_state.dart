part of "categories_bloc.dart";

class CategoriesState extends Equatable {
  final List<XCategories>? items;

  const CategoriesState({
    this.items,
  });

  CategoriesState copyWith({
    List<XCategories>? items,
  }) {
    items?.sort((a, b) {
      int item1 = int.parse(a.id);
      int item2 = int.parse(b.id);

      return item1.compareTo(item2);
    });
    return CategoriesState(
      items: items ?? this.items,
    );
  }

  @override
  List<Object?> get props => [items];
}
