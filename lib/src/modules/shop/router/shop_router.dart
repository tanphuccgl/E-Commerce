import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/src/config/routes/auto_router.gr.dart';

import 'package:e_commerce/src/modules/dashboard/router/dashboard_router.dart';
import 'package:e_commerce/src/modules/detail_category/pages/detail_category_page.dart';
import 'package:e_commerce/src/modules/detail_category/pages/search_products_page.dart';
import 'package:e_commerce/src/modules/shop/pages/shop_page.dart';

import 'package:flutter/cupertino.dart';

class ShopRouters {
  static const String productByCategory = 'product_by_category';
  static const String searchProductsByCategory = 'search_products_by_category';
}

class ShopCoordinator {
  static const autoRoute = AutoRoute(
      path: DashboardRouters.shopTab,
      page: EmptyRouterPage,
      name: 'ShopTab',
      children: [
        AutoRoute(path: "", page: ShopPage, name: "ShopRoute"),
        AutoRoute(
            path: ShopRouters.productByCategory,
            page: DetailCategoryPage,
            name: "DetailCategoryRoute"),
        AutoRoute(
            path: ShopRouters.searchProductsByCategory,
            page: SearchProductsByCategoryPage,
            name: "SearchProductsByCategoryRoute"),
        RedirectRoute(path: '*', redirectTo: ''),
      ]);

  static showProductByCategory(BuildContext context,
          {required String idCategory, required String nameCategory}) =>
      context.router.push(DetailCategoryRoute(
          idCategory: idCategory, nameCategory: nameCategory));

  static showSearchProductByCategory(BuildContext context) =>
      context.router.push(const SearchProductsByCategoryRoute());

  static switchCategory(BuildContext context,
          {required String idCategory, required String nameCategory}) =>
      context.router.replace(DetailCategoryRoute(
          idCategory: idCategory, nameCategory: nameCategory));
}
