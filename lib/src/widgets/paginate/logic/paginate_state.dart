part of 'paginate_bloc.dart';

class PaginateState extends Equatable {
  final bool isLoadMore;
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
  PaginateState copyWithItem(
      {bool? isLoadMore, XPaginate<DocumentSnapshot>? docs}) {
    return PaginateState(
        docs: docs ?? this.docs, isLoadMore: isLoadMore ?? this.isLoadMore);
  }
}
