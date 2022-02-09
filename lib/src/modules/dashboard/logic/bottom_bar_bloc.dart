import 'package:e_commerce/src/modules/dashboard/router/dashboard_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_bar_state.dart';

class BottomBarBloc extends Cubit<BottomBarState> {
  BottomBarBloc() : super(const BottomBarState(DashboardRouters.home, 0));

  void getPage(String item) {
    switch (item) {
      case DashboardRouters.home:
        emit(const BottomBarState(DashboardRouters.home, 0));
        break;
      case DashboardRouters.shop:
        emit(const BottomBarState(DashboardRouters.shop, 1));
        break;
      case DashboardRouters.bag:
        emit(const BottomBarState(DashboardRouters.bag, 2));
        break;
      case DashboardRouters.favorites:
        emit(const BottomBarState(DashboardRouters.favorites, 3));
        break;
      case DashboardRouters.profile:
        emit(const BottomBarState(DashboardRouters.profile, 4));
        break;
    }
  }
  
}
