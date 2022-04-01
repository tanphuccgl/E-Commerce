part of 'paginate_bloc.dart';

class PaginateState<T> extends Equatable {
  // TODO: ko cần thiết
  final bool isLoadMore;
  // Ko sử dụng DocumentSnapshot mà thay vào đó sử dụng Generic type
  final XPaginate<DocumentSnapshot> docs;

  List<XProduct> get convertDocsToProductsByUser {
    User? currentUser = AuthService().currentUser;
    List<XProduct> list = (docs.data ?? [])
        .map((e) => e.data() as XProduct)
        .where((e) => e.idUser == currentUser?.uid)
        .toList();
    return list;
  }

  const PaginateState({this.isLoadMore = false, required this.docs});

  @override
  List<Object?> get props => [isLoadMore, docs];
  // Sử dụng khi load xong 1 trang
  PaginateState copyWithItem(XResult<List<T>> docs) {
    return copyWith(
      docs: this.docs.result(docs),
    );
  }

  PaginateState<T> copyWith({
    bool? isLoadMore,
    XPaginate<DocumentSnapshot>? docs,
  }) {
    return PaginateState<T>(
      isLoadMore: isLoadMore ?? this.isLoadMore,
      docs: docs ?? this.docs,
    );
  }
}

// class PaginateResponse<T> {
//   List<T> items;
//   bool success;
//   String message;
//   int pageIndex;
//   int totalItem;
//   int maxPage;
// }
