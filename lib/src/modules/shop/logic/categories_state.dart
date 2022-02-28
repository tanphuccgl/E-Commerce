part of "categories_bloc.dart";

class CategoriesState extends Equatable {
  final List<XCategories>? items;
  const CategoriesState({
     this.items,
  });

  CategoriesState copyWith({
    List<XCategories>? items,
  }) {
    return CategoriesState(
      items: items ?? this.items,
    );
  }

  @override
  List<Object?> get props => [items];
}
