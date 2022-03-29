part of 'paginate_bloc.dart';

enum PaginationStatus { initial, loading, loader, error, empty }

class PaginateState extends Equatable {
  final XHandlePaginate<List<XProduct>> items;
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
    XHandlePaginate<List<XProduct>>? items,
  }) {
    return PaginateState(
        isLoadingMore: isLoadingMore ?? this.isLoadingMore,
        isRefresh: isRefresh ?? this.isRefresh,
        paginationStatus: paginationStatus ?? this.paginationStatus,
        items: items ?? this.items);
  }
}
