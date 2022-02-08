import 'package:e_commerce/src/modules/dashboard/router/dashboard_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_bar_state.dart';

class BottomBarBloc extends Cubit<BottomBarState> {
  BottomBarBloc() : super(const BottomBarState(HomeRouters.dashboard, 0));

  void getPage(String item) {
    switch (item) {
      case HomeRouters.dashboard:
        emit(const BottomBarState(HomeRouters.dashboard, 0));
        break;
      case HomeRouters.a:
        emit(const BottomBarState(HomeRouters.a, 1));
        break;
    }
  }
}
