import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/src/models/result.dart';
import 'package:e_commerce/src/repositories/domain.dart';
import 'package:e_commerce/src/widgets/paginate/logic/paginate_bloc.dart';
import 'package:e_commerce/src/widgets/paginate/paginate.dart';
import 'package:e_commerce/src/widgets/snackbar/snackbar.dart';

part 'paginate_favorites_state.dart';

class PaginateFavoritesBloc
    extends PaginateBloc<PaginateFavoritesState<DocumentSnapshot>> {
  PaginateFavoritesBloc() : super(PaginateFavoritesState(XPaginate.initial())) {
    fetchFirstData();
  }
  Domain domain = Domain();

  @override
  Future<void> fetchFirstData() async {
    emit(state.copyWithItem(XPaginate.initial()));
    return fetchNextData();
  }

  @override
  Future<void> fetchNextData() async {
    if (state.docs.canNext) {
      emit(state.copyWithItem(state.docs.loading()));
    }

    final value =
        await domain.favorite.getNextProductToFavorite(state.docs.lastDoc);
    if (value.isSuccess) {
      emit(state
          .copyWithItem(state.docs.result(XResult.success(value.data ?? []))));
    } else {
      XSnackBar.show(msg: 'Fetch Next Page Failed');
    }
  }
}
