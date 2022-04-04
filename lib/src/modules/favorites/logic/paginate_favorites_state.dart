part of 'paginate_favorites_bloc.dart';

class PaginateFavoritesState extends PaginateState {
  const PaginateFavoritesState(XPaginate docs) : super(docs);

  @override
  List<Object?> get props => [docs];
  @override
  PaginateFavoritesState copyWithItem(XPaginate docs) {
    return PaginateFavoritesState(docs);
  }
}
