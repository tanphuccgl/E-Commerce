import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/src/config/routes/auto_router.gr.dart';
import 'package:e_commerce/src/modules/dashboard/router/dashboard_router.dart';
import 'package:e_commerce/src/modules/home/pages/home_page.dart';
import 'package:e_commerce/src/modules/home/router/home_wrapper_router.dart';
import 'package:e_commerce/src/modules/view_all_products/pages/view_all_products_page.dart';
import 'package:e_commerce/src/utils/enum/product_type.dart';
import 'package:flutter/material.dart';

class HomeRouters {
  static const String viewAll = 'view_all';
}

class HomeCoordinator {
  static const autoRoute = AutoRoute(
      path: DashboardRouters.homeTab,
      page: HomeWrapperPage,
      name: 'HomeTab',
      children: [
        AutoRoute(path: "", page: HomePage, name: "HomeRoute"),
        AutoRoute(
            path: HomeRouters.viewAll,
            page: ViewAllProductsPage,
            name: "ViewAllRoute"),
        RedirectRoute(path: '*', redirectTo: ''),
      ]);

  static showViewAll(BuildContext context,
          {required ProductType productType}) =>
      context.router.push(ViewAllRoute(productType: productType));
}
