// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/cupertino.dart' as _i18;
import 'package:flutter/material.dart' as _i17;

import '../../modules/auth/login/pages/login_page.dart' as _i15;
import '../../modules/auth/login/router/sign_wrapper_router.dart' as _i2;
import '../../modules/auth/sign_up/pages/sign_up_page.dart' as _i16;
import '../../modules/bag/pages/bag_page.dart' as _i7;
import '../../modules/dashboard/pages/dashboard_page.dart' as _i4;
import '../../modules/dashboard/router/dashboard_wrapper_router.dart' as _i1;
import '../../modules/favorites/pages/favorites_page.dart' as _i11;
import '../../modules/favorites/pages/search_product_by_favorite_page.dart'
    as _i12;
import '../../modules/home/pages/home_page.dart' as _i5;
import '../../modules/loading/pages/loading_page.dart' as _i3;
import '../../modules/product_by_category/pages/product_by_category_page.dart'
    as _i9;
import '../../modules/product_by_category/pages/search_products_page.dart'
    as _i10;
import '../../modules/profile/pages/profile_page.dart' as _i13;
import '../../modules/settings/pages/setting_page.dart' as _i14;
import '../../modules/shop/pages/shop_page.dart' as _i8;

class XRouter extends _i6.RootStackRouter {
  XRouter([_i17.GlobalKey<_i17.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    DashboardWrapperRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.DashboardWrapperPage());
    },
    SignRouter.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.SignWrapperPage());
    },
    LoadingRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.LoadingPage());
    },
    DashboardRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.DashboardPage());
    },
    HomeRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.HomePage());
    },
    ShopTab.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.EmptyRouterPage());
    },
    BagRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.BagPage());
    },
    FavoritesTab.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.EmptyRouterPage());
    },
    ProfileTab.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.EmptyRouterPage());
    },
    ShopRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.ShopPage());
    },
    ProductByCategoryRoute.name: (routeData) {
      final args = routeData.argsAs<ProductByCategoryRouteArgs>();
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i9.ProductByCategoryPage(
              key: args.key,
              idCategory: args.idCategory,
              nameCategory: args.nameCategory));
    },
    SearchProductsByCategoryRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData,
          child: const _i10.SearchProductsByCategoryPage());
    },
    FavoritesRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.FavoritesPage());
    },
    SearchProductsByFavoriteRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData,
          child: const _i12.SearchProductsByFavoritePage());
    },
    ProfileRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.ProfilePage());
    },
    SettingRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i14.SettingPage());
    },
    LoginRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i15.LoginPage());
    },
    SignUpRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i16.SignUpPage());
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig('/#redirect',
            path: '/', redirectTo: '', fullMatch: true),
        _i6.RouteConfig(DashboardWrapperRoute.name,
            path: '/dashboard',
            children: [
              _i6.RouteConfig(DashboardRoute.name,
                  path: '',
                  parent: DashboardWrapperRoute.name,
                  children: [
                    _i6.RouteConfig(HomeRoute.name,
                        path: 'home', parent: DashboardRoute.name),
                    _i6.RouteConfig(ShopTab.name,
                        path: 'shop',
                        parent: DashboardRoute.name,
                        children: [
                          _i6.RouteConfig(ShopRoute.name,
                              path: '', parent: ShopTab.name),
                          _i6.RouteConfig(ProductByCategoryRoute.name,
                              path: 'productByCategory', parent: ShopTab.name),
                          _i6.RouteConfig(SearchProductsByCategoryRoute.name,
                              path: 'searchProductsByCategoryPage',
                              parent: ShopTab.name),
                          _i6.RouteConfig('*#redirect',
                              path: '*',
                              parent: ShopTab.name,
                              redirectTo: '',
                              fullMatch: true)
                        ]),
                    _i6.RouteConfig(BagRoute.name,
                        path: 'bag', parent: DashboardRoute.name),
                    _i6.RouteConfig(FavoritesTab.name,
                        path: 'favorites',
                        parent: DashboardRoute.name,
                        children: [
                          _i6.RouteConfig(FavoritesRoute.name,
                              path: '', parent: FavoritesTab.name),
                          _i6.RouteConfig(SearchProductsByFavoriteRoute.name,
                              path: 'searchProductsByFavoritePage',
                              parent: FavoritesTab.name),
                          _i6.RouteConfig('*#redirect',
                              path: '*',
                              parent: FavoritesTab.name,
                              redirectTo: '',
                              fullMatch: true)
                        ]),
                    _i6.RouteConfig(ProfileTab.name,
                        path: 'profile',
                        parent: DashboardRoute.name,
                        children: [
                          _i6.RouteConfig(ProfileRoute.name,
                              path: '', parent: ProfileTab.name),
                          _i6.RouteConfig(SettingRoute.name,
                              path: 'setting', parent: ProfileTab.name),
                          _i6.RouteConfig('*#redirect',
                              path: '*',
                              parent: ProfileTab.name,
                              redirectTo: '',
                              fullMatch: true)
                        ]),
                    _i6.RouteConfig('*#redirect',
                        path: '*',
                        parent: DashboardRoute.name,
                        redirectTo: '',
                        fullMatch: true)
                  ]),
              _i6.RouteConfig('*#redirect',
                  path: '*',
                  parent: DashboardWrapperRoute.name,
                  redirectTo: '',
                  fullMatch: true)
            ]),
        _i6.RouteConfig(SignRouter.name, path: '/sign', children: [
          _i6.RouteConfig('#redirect',
              path: '',
              parent: SignRouter.name,
              redirectTo: 'register',
              fullMatch: true),
          _i6.RouteConfig(LoginRoute.name,
              path: 'login', parent: SignRouter.name),
          _i6.RouteConfig(SignUpRoute.name,
              path: 'register', parent: SignRouter.name),
          _i6.RouteConfig('*#redirect',
              path: '*',
              parent: SignRouter.name,
              redirectTo: '',
              fullMatch: true)
        ]),
        _i6.RouteConfig(LoadingRoute.name, path: ''),
        _i6.RouteConfig('*#redirect',
            path: '*', redirectTo: '', fullMatch: true)
      ];
}

/// generated route for
/// [_i1.DashboardWrapperPage]
class DashboardWrapperRoute extends _i6.PageRouteInfo<void> {
  const DashboardWrapperRoute({List<_i6.PageRouteInfo>? children})
      : super(DashboardWrapperRoute.name,
            path: '/dashboard', initialChildren: children);

  static const String name = 'DashboardWrapperRoute';
}

/// generated route for
/// [_i2.SignWrapperPage]
class SignRouter extends _i6.PageRouteInfo<void> {
  const SignRouter({List<_i6.PageRouteInfo>? children})
      : super(SignRouter.name, path: '/sign', initialChildren: children);

  static const String name = 'SignRouter';
}

/// generated route for
/// [_i3.LoadingPage]
class LoadingRoute extends _i6.PageRouteInfo<void> {
  const LoadingRoute() : super(LoadingRoute.name, path: '');

  static const String name = 'LoadingRoute';
}

/// generated route for
/// [_i4.DashboardPage]
class DashboardRoute extends _i6.PageRouteInfo<void> {
  const DashboardRoute({List<_i6.PageRouteInfo>? children})
      : super(DashboardRoute.name, path: '', initialChildren: children);

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i5.HomePage]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: 'home');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i6.EmptyRouterPage]
class ShopTab extends _i6.PageRouteInfo<void> {
  const ShopTab({List<_i6.PageRouteInfo>? children})
      : super(ShopTab.name, path: 'shop', initialChildren: children);

  static const String name = 'ShopTab';
}

/// generated route for
/// [_i7.BagPage]
class BagRoute extends _i6.PageRouteInfo<void> {
  const BagRoute() : super(BagRoute.name, path: 'bag');

  static const String name = 'BagRoute';
}

/// generated route for
/// [_i6.EmptyRouterPage]
class FavoritesTab extends _i6.PageRouteInfo<void> {
  const FavoritesTab({List<_i6.PageRouteInfo>? children})
      : super(FavoritesTab.name, path: 'favorites', initialChildren: children);

  static const String name = 'FavoritesTab';
}

/// generated route for
/// [_i6.EmptyRouterPage]
class ProfileTab extends _i6.PageRouteInfo<void> {
  const ProfileTab({List<_i6.PageRouteInfo>? children})
      : super(ProfileTab.name, path: 'profile', initialChildren: children);

  static const String name = 'ProfileTab';
}

/// generated route for
/// [_i8.ShopPage]
class ShopRoute extends _i6.PageRouteInfo<void> {
  const ShopRoute() : super(ShopRoute.name, path: '');

  static const String name = 'ShopRoute';
}

/// generated route for
/// [_i9.ProductByCategoryPage]
class ProductByCategoryRoute
    extends _i6.PageRouteInfo<ProductByCategoryRouteArgs> {
  ProductByCategoryRoute(
      {_i18.Key? key, required String idCategory, required String nameCategory})
      : super(ProductByCategoryRoute.name,
            path: 'productByCategory',
            args: ProductByCategoryRouteArgs(
                key: key, idCategory: idCategory, nameCategory: nameCategory));

  static const String name = 'ProductByCategoryRoute';
}

class ProductByCategoryRouteArgs {
  const ProductByCategoryRouteArgs(
      {this.key, required this.idCategory, required this.nameCategory});

  final _i18.Key? key;

  final String idCategory;

  final String nameCategory;

  @override
  String toString() {
    return 'ProductByCategoryRouteArgs{key: $key, idCategory: $idCategory, nameCategory: $nameCategory}';
  }
}

/// generated route for
/// [_i10.SearchProductsByCategoryPage]
class SearchProductsByCategoryRoute extends _i6.PageRouteInfo<void> {
  const SearchProductsByCategoryRoute()
      : super(SearchProductsByCategoryRoute.name,
            path: 'searchProductsByCategoryPage');

  static const String name = 'SearchProductsByCategoryRoute';
}

/// generated route for
/// [_i11.FavoritesPage]
class FavoritesRoute extends _i6.PageRouteInfo<void> {
  const FavoritesRoute() : super(FavoritesRoute.name, path: '');

  static const String name = 'FavoritesRoute';
}

/// generated route for
/// [_i12.SearchProductsByFavoritePage]
class SearchProductsByFavoriteRoute extends _i6.PageRouteInfo<void> {
  const SearchProductsByFavoriteRoute()
      : super(SearchProductsByFavoriteRoute.name,
            path: 'searchProductsByFavoritePage');

  static const String name = 'SearchProductsByFavoriteRoute';
}

/// generated route for
/// [_i13.ProfilePage]
class ProfileRoute extends _i6.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: '');

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i14.SettingPage]
class SettingRoute extends _i6.PageRouteInfo<void> {
  const SettingRoute() : super(SettingRoute.name, path: 'setting');

  static const String name = 'SettingRoute';
}

/// generated route for
/// [_i15.LoginPage]
class LoginRoute extends _i6.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: 'login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i16.SignUpPage]
class SignUpRoute extends _i6.PageRouteInfo<void> {
  const SignUpRoute() : super(SignUpRoute.name, path: 'register');

  static const String name = 'SignUpRoute';
}
