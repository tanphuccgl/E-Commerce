import 'package:e_commerce/src/models/handle.dart';
import 'package:e_commerce/src/modules/cart/logic/cart_bloc.dart';
import 'package:e_commerce/src/modules/dashboard/logic/bottom_bar_bloc.dart';
import 'package:e_commerce/src/modules/favorites/logic/favorites_bloc.dart';
import 'package:e_commerce/src/modules/product/logic/list_products_filter_bloc.dart';
import 'package:e_commerce/src/modules/promotion/logic/promotion_bloc.dart';
import 'package:e_commerce/src/modules/shop/logic/categories_bloc.dart';
import 'package:e_commerce/src/modules/view_all_products/logic/view_all_products_bloc.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardWrapperPage extends StatelessWidget {
  const DashboardWrapperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => BottomBarBloc()),
          BlocProvider(create: (_) => CartBloc()),
          BlocProvider(create: (_) => FavoriteBloc()),
          BlocProvider(
              create: (_) => ListProductsFilterBloc(ListProductsFilterState(
                  docs: XHandle.initial(),
                  searchList: XHandle.completed([]),
                  items: XHandle.completed([])))),
          BlocProvider(create: (_) => CategoriesBloc()),
          BlocProvider(create: (_) => PromotionBloc()),
          BlocProvider(create: (_) => ViewAllProductsBloc()),
        ],
        child: WillPopScope(
            onWillPop: () async => false,
            child: const Scaffold(body: AutoRouter())));
  }
}
