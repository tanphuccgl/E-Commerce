import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/src/config/routes/auto_router.gr.dart';

import 'package:e_commerce/src/config/routes/page_routers.dart';
import 'package:e_commerce/src/modules/cart/pages/cart_page.dart';
import 'package:e_commerce/src/modules/checkout/pages/checkout_page.dart';
import 'package:e_commerce/src/modules/dashboard/pages/dashboard_page.dart';
import 'package:e_commerce/src/modules/dashboard/router/dashboard_wrapper_router.dart';
import 'package:e_commerce/src/modules/detail_category/pages/detail_category_page.dart';
import 'package:e_commerce/src/modules/detail_category/pages/search_products_page.dart';
import 'package:e_commerce/src/modules/favorites/pages/favorites_page.dart';
import 'package:e_commerce/src/modules/favorites/pages/search_favorite_page.dart';
import 'package:e_commerce/src/modules/home/pages/home_page.dart';
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
  static const String searchProductsByCategoryPage =
      'searchProductsByCategoryPage';
  static const String searchProductsByFavoritePage =
      'searchProductsByFavoritePage';
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
                      page: DetailCategoryPage,
                      name: "DetailCategoryRoute"),
                  AutoRoute(
                      path: DashboardRouters.searchProductsByCategoryPage,
                      page: SearchProductsByCategoryPage,
                      name: "SearchProductsByCategoryRoute"),
                  RedirectRoute(path: '*', redirectTo: ''),
                ]),
            AutoRoute(
                path: DashboardRouters.bag,
                page: EmptyRouterPage,
                name: 'BagTab',
                children: [
                  AutoRoute(path: "", page: BagPage, name: "BagRoute"),
                  AutoRoute(
                      path: "checkout",
                      page: CheckoutPage,
                      name: "CheckoutRoute"),
                  RedirectRoute(path: '*', redirectTo: ''),
                ]),
            AutoRoute(
                path: DashboardRouters.favorites,
                page: EmptyRouterPage,
                name: 'FavoritesTab',
                children: [
                  AutoRoute(
                      path: "", page: FavoritesPage, name: "FavoritesRoute"),
                  AutoRoute(
                      path: DashboardRouters.searchProductsByFavoritePage,
                      page: SearchFavoritePage,
                      name: "SearchFavoriteRoute"),
                  RedirectRoute(path: '*', redirectTo: ''),
                ]),
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

  static showSetting(BuildContext context) =>
      context.router.push(const SettingRoute());

  static showProductByCategory(BuildContext context,
          {required String idCategory, required String nameCategory}) =>
      context.router.push(DetailCategoryRoute(
          idCategory: idCategory, nameCategory: nameCategory));

  static showSearchProductByCategory(
    BuildContext context,
  ) =>
      context.router.push(const SearchProductsByCategoryRoute());

  static showSearchProductByFavorite(
    BuildContext context,
  ) =>
      context.router.push(const SearchFavoriteRoute());

  static switchCategory(BuildContext context,
          {required String idCategory, required String nameCategory}) =>
      context.router.replace(DetailCategoryRoute(
          idCategory: idCategory, nameCategory: nameCategory));

  static showYourCart(BuildContext context) =>
      context.router.navigate(const DashboardRoute(children: [BagTab()]));
  static showCheckoutScreen(BuildContext context) =>
      context.router.push(const CheckoutRoute());
}
