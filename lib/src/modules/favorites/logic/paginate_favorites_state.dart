part of 'paginate_favorites_bloc.dart';

class PaginateFavoritesState<DocumentSnapshot>
    extends PaginateState<DocumentSnapshot> {
  const PaginateFavoritesState(XPaginate<DocumentSnapshot> docs) : super(docs);

  @override
  List<Object?> get props => [docs];
  @override
  PaginateFavoritesState<DocumentSnapshot> copyWithItem(
      XPaginate<DocumentSnapshot> docs) {
    return PaginateFavoritesState(docs);
  }
}
