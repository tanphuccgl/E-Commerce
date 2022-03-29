part of 'paginate_favorites_bloc.dart';

class PaginateFavoritesState extends PaginateState {
  final XHandlePaginate<List<XProduct>> listFavorites;
  const PaginateFavoritesState(
      {required XHandlePaginate<List<XProduct>> items,
      required this.listFavorites,
      bool isLoadingMore = false,
      bool isRefresh = false,
      PaginationStatus paginationStatus = PaginationStatus.initial})
      : super(
            items: items,
            isLoadingMore: isLoadingMore,
            isRefresh: isRefresh,
            paginationStatus: paginationStatus);
  @override
  List<Object?> get props =>
      [isLoadingMore, isRefresh, items, paginationStatus, listFavorites];
  @override
  PaginateFavoritesState copyWith({
    bool? isLoadingMore,
    bool? isRefresh,
    PaginationStatus? paginationStatus,
    XHandlePaginate<List<XProduct>>? items,
    XHandlePaginate<List<XProduct>>? listFavorites,
  }) {
    return PaginateFavoritesState(
        isLoadingMore: isLoadingMore ?? this.isLoadingMore,
        isRefresh: isRefresh ?? this.isRefresh,
        paginationStatus: paginationStatus ?? this.paginationStatus,
        listFavorites: listFavorites ?? this.listFavorites,
        items: items ?? this.items);
  }
}
