part of 'paginate_bloc.dart';

enum PaginationStatus { initial, loading, loader, error, empty }

class PaginateState<T> extends Equatable {
  final XHandlePaginate<List<T>> items;
  final bool isLoadingMore;
  final bool isRefresh;
  final PaginationStatus paginationStatus;

  const PaginateState(
      {this.isLoadingMore = false,
      this.isRefresh = false,
      required this.items,
      this.paginationStatus = PaginationStatus.initial});

  @override
  List<Object?> get props =>
      [isLoadingMore, isRefresh, items, paginationStatus];

  PaginateState copyWith({
    bool? isLoadingMore,
    bool? isRefresh,
    PaginationStatus? paginationStatus,
    XHandlePaginate<List<T>>? items,
  }) {
    return PaginateState(
        isLoadingMore: isLoadingMore ?? this.isLoadingMore,
        isRefresh: isRefresh ?? this.isRefresh,
        paginationStatus: paginationStatus ?? this.paginationStatus,
        items: items ?? this.items);
  }
}
