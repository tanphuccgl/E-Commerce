import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/src/config/routes/auto_router.gr.dart';

import 'package:e_commerce/src/config/routes/page_routers.dart';
import 'package:e_commerce/src/modules/bag/pages/bag_page.dart';
import 'package:e_commerce/src/modules/dashboard/pages/dashboard_page.dart';
import 'package:e_commerce/src/modules/dashboard/router/dashboard_wrapper_router.dart';
import 'package:e_commerce/src/modules/favorites/pages/favorites_page.dart';
import 'package:e_commerce/src/modules/home/pages/home_page.dart';
import 'package:e_commerce/src/modules/product_by_category/pages/product_by_category_page.dart';
import 'package:e_commerce/src/modules/profile/pages/profile_page.dart';
import 'package:e_commerce/src/modules/settings/pages/setting_page.dart';
import 'package:e_commerce/src/modules/shop/pages/shop_page.dart';


import 'package:flutter/cupertino.dart';

class DashboardRouters {
  static const String dashboard = '';
  static const String home = 'home';
  static const String shop = 'shop';
  static const String bag = 'bag';
  static const String favorites = 'favorites';
  static const String profile = 'profile';
  static const String setting = 'setting';
  static const String productByCategoryPage = 'productByCategory';
}

class DashboardCoordinator {
  static const autoRoute = AutoRoute(
    path: XRoutes.dashboard,
    name: "DashboardWrapperRoute",
    page: DashboardWrapperPage,
    children: [
      AutoRoute(
          path: DashboardRouters.dashboard,
          name: "DashboardRoute",
          page: DashboardPage,
          initial: true,
          children: [
            AutoRoute(path: DashboardRouters.home, page: HomePage),
            AutoRoute(
                path: DashboardRouters.shop,
                page: EmptyRouterPage,
                name: 'ShopTab',
                children: [
                  AutoRoute(path: "", page: ShopPage, name: "ShopRoute"),
                  AutoRoute(
                      path: DashboardRouters.productByCategoryPage,
                      page: ProductByCategoryPage,
                      name: "ProductByCategoryRoute"),
                  RedirectRoute(path: '*', redirectTo: ''),
                ]),
            AutoRoute(path: DashboardRouters.bag, page: BagPage),
            AutoRoute(path: DashboardRouters.favorites, page: FavoritesPage),
            AutoRoute(
                name: "ProfileTab",
                page: EmptyRouterPage,
                path: DashboardRouters.profile,
                children: [
                  AutoRoute(path: "", page: ProfilePage, name: "ProfileRoute"),
                  AutoRoute(
                      path: DashboardRouters.setting,
                      page: SettingPage,
                      name: "SettingRoute"),
                  RedirectRoute(path: '*', redirectTo: ''),
                ]),
            RedirectRoute(path: '*', redirectTo: ''),
          ]),
      RedirectRoute(path: '*', redirectTo: ''),
    ],
  );

  static showSetting(BuildContext context) {
    context.router.push(const SettingRoute());
  }

  static showTops(BuildContext context,
      {required String idCategory, required String nameCategory}) {
    context.router
        .push(ProductByCategoryRoute(idCategory: idCategory, nameCategory: nameCategory));
  }
}
