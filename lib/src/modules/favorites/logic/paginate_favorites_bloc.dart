import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/models/result.dart';
import 'package:e_commerce/src/repositories/domain.dart';
import 'package:e_commerce/src/repositories/firestore/services/auth_service.dart';
import 'package:e_commerce/src/widgets/paginate/logic/paginate_bloc.dart';
import 'package:e_commerce/src/widgets/paginate/paginate.dart';
import 'package:e_commerce/src/widgets/snackbar/snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'paginate_favorites_state.dart';

class PaginateFavoritesBloc extends PaginateBloc {
  PaginateFavoritesBloc() : super(PaginateState(XPaginate.initial())) {
    fetchFirstData();
  }
  XPaginate<dynamic>? paginate;
  List<DocumentSnapshot>? documentSnapshot;
  Domain domain = Domain();

  @override
  Future<void> fetchFirstData() async {
    var value = await domain.favorite.getProductToFavorite();
    if (value.isSuccess) {
      final listDocs = value.data ?? [];
      documentSnapshot = listDocs;

      paginate = XPaginate()
          .result(XResult.success(_convertDocsToProductsByUser(listDocs)));
      emit(state.copyWithItem(paginate ?? XPaginate()));
    } else {
      XSnackBar.show(msg: 'Page load failed');
    }
  }

  @override
  Future<void> fetchNextData() async {
    if ((paginate ?? XPaginate()).canNext) {
      paginate = (paginate ?? XPaginate()).loading();
      emit(state.copyWithItem(paginate ?? XPaginate()));
    }

    await Future.delayed(const Duration(seconds: 3));

    var value =
        await domain.favorite.getNextProductToFavorite(documentSnapshot ?? []);

    if (value.isSuccess) {
      final listDocs = value.data ?? [];
      if (listDocs.isNotEmpty) {
        (documentSnapshot ?? []).addAll(listDocs);
      }

      paginate = (paginate ?? XPaginate())
          .result(XResult.success(_convertDocsToProductsByUser(listDocs)));

      emit(state.copyWithItem(paginate ?? XPaginate()));
    } else {
      XSnackBar.show(msg: 'Fetch Next Page Failed');
    }
  }

  List<XProduct> _convertDocsToProductsByUser(List<DocumentSnapshot> docs) {
    User? currentUser = AuthService().currentUser;
    List<XProduct> list = (docs)
        .map((e) => e.data() as XProduct)
        .where((e) => e.idUser == currentUser?.uid)
        .toList();
    return list;
  }
}
