// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/cupertino.dart' as _i19;
import 'package:flutter/material.dart' as _i18;

import '../../models/products_model.dart' as _i20;
import '../../modules/auth/login/pages/login_page.dart' as _i16;
import '../../modules/auth/login/router/sign_wrapper_router.dart' as _i2;
import '../../modules/auth/sign_up/pages/sign_up_page.dart' as _i17;
import '../../modules/bag/pages/bag_page.dart' as _i8;
import '../../modules/dashboard/pages/dashboard_page.dart' as _i5;
import '../../modules/dashboard/router/dashboard_wrapper_router.dart' as _i1;
import '../../modules/detail_category/pages/detail_category_page.dart' as _i10;
import '../../modules/detail_category/pages/search_products_page.dart' as _i11;
import '../../modules/favorites/pages/favorites_page.dart' as _i12;
import '../../modules/favorites/pages/search_favorite_page.dart' as _i13;
import '../../modules/home/pages/home_page.dart' as _i6;
import '../../modules/loading/pages/loading_page.dart' as _i3;
import '../../modules/product_details/pages/product_details_page.dart' as _i4;
import '../../modules/profile/pages/profile_page.dart' as _i14;
import '../../modules/settings/pages/setting_page.dart' as _i15;
import '../../modules/shop/pages/shop_page.dart' as _i9;

class XRouter extends _i7.RootStackRouter {
  XRouter([_i18.GlobalKey<_i18.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    DashboardWrapperRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.DashboardWrapperPage());
    },
    SignRouter.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.SignWrapperPage());
    },
    LoadingRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.LoadingPage());
    },
    ProductDetailsRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ProductDetailsRouteArgs>(
          orElse: () =>
              ProductDetailsRouteArgs(id: pathParams.getString('id')));
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.ProductDetailsPage(
              id: args.id, key: args.key, data: args.data));
    },
    DashboardRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.DashboardPage());
    },
    HomeRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.HomePage());
    },
    ShopTab.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.EmptyRouterPage());
    },
    BagRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.BagPage());
    },
    FavoritesTab.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.EmptyRouterPage());
    },
    ProfileTab.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.EmptyRouterPage());
    },
    ShopRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.ShopPage());
    },
    DetailCategoryRoute.name: (routeData) {
      final args = routeData.argsAs<DetailCategoryRouteArgs>();
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i10.DetailCategoryPage(
              key: args.key,
              idCategory: args.idCategory,
              nameCategory: args.nameCategory));
    },
    SearchProductsByCategoryRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData,
          child: const _i11.SearchProductsByCategoryPage());
    },
    FavoritesRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.FavoritesPage());
    },
    SearchFavoriteRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.SearchFavoritePage());
    },
    ProfileRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i14.ProfilePage());
    },
    SettingRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i15.SettingPage());
    },
    LoginRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i16.LoginPage());
    },
    SignUpRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i17.SignUpPage());
    }
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig('/#redirect',
            path: '/', redirectTo: '', fullMatch: true),
        _i7.RouteConfig(DashboardWrapperRoute.name,
            path: '/dashboard',
            children: [
              _i7.RouteConfig(DashboardRoute.name,
                  path: '',
                  parent: DashboardWrapperRoute.name,
                  children: [
                    _i7.RouteConfig(HomeRoute.name,
                        path: 'home', parent: DashboardRoute.name),
                    _i7.RouteConfig(ShopTab.name,
                        path: 'shop',
                        parent: DashboardRoute.name,
                        children: [
                          _i7.RouteConfig(ShopRoute.name,
                              path: '', parent: ShopTab.name),
                          _i7.RouteConfig(DetailCategoryRoute.name,
                              path: 'productByCategory', parent: ShopTab.name),
                          _i7.RouteConfig(SearchProductsByCategoryRoute.name,
                              path: 'searchProductsByCategoryPage',
                              parent: ShopTab.name),
                          _i7.RouteConfig('*#redirect',
                              path: '*',
                              parent: ShopTab.name,
                              redirectTo: '',
                              fullMatch: true)
                        ]),
                    _i7.RouteConfig(BagRoute.name,
                        path: 'bag', parent: DashboardRoute.name),
                    _i7.RouteConfig(FavoritesTab.name,
                        path: 'favorites',
                        parent: DashboardRoute.name,
                        children: [
                          _i7.RouteConfig(FavoritesRoute.name,
                              path: '', parent: FavoritesTab.name),
                          _i7.RouteConfig(SearchFavoriteRoute.name,
                              path: 'searchProductsByFavoritePage',
                              parent: FavoritesTab.name),
                          _i7.RouteConfig('*#redirect',
                              path: '*',
                              parent: FavoritesTab.name,
                              redirectTo: '',
                              fullMatch: true)
                        ]),
                    _i7.RouteConfig(ProfileTab.name,
                        path: 'profile',
                        parent: DashboardRoute.name,
                        children: [
                          _i7.RouteConfig(ProfileRoute.name,
                              path: '', parent: ProfileTab.name),
                          _i7.RouteConfig(SettingRoute.name,
                              path: 'setting', parent: ProfileTab.name),
                          _i7.RouteConfig('*#redirect',
                              path: '*',
                              parent: ProfileTab.name,
                              redirectTo: '',
                              fullMatch: true)
                        ]),
                    _i7.RouteConfig('*#redirect',
                        path: '*',
                        parent: DashboardRoute.name,
                        redirectTo: '',
                        fullMatch: true)
                  ]),
              _i7.RouteConfig('*#redirect',
                  path: '*',
                  parent: DashboardWrapperRoute.name,
                  redirectTo: '',
                  fullMatch: true)
            ]),
        _i7.RouteConfig(SignRouter.name, path: '/sign', children: [
          _i7.RouteConfig('#redirect',
              path: '',
              parent: SignRouter.name,
              redirectTo: 'register',
              fullMatch: true),
          _i7.RouteConfig(LoginRoute.name,
              path: 'login', parent: SignRouter.name),
          _i7.RouteConfig(SignUpRoute.name,
              path: 'register', parent: SignRouter.name),
          _i7.RouteConfig('*#redirect',
              path: '*',
              parent: SignRouter.name,
              redirectTo: '',
              fullMatch: true)
        ]),
        _i7.RouteConfig(LoadingRoute.name, path: ''),
        _i7.RouteConfig(ProductDetailsRoute.name, path: '/detail/:id'),
        _i7.RouteConfig('*#redirect',
            path: '*', redirectTo: '', fullMatch: true)
      ];
}

/// generated route for
/// [_i1.DashboardWrapperPage]
class DashboardWrapperRoute extends _i7.PageRouteInfo<void> {
  const DashboardWrapperRoute({List<_i7.PageRouteInfo>? children})
      : super(DashboardWrapperRoute.name,
            path: '/dashboard', initialChildren: children);

  static const String name = 'DashboardWrapperRoute';
}

/// generated route for
/// [_i2.SignWrapperPage]
class SignRouter extends _i7.PageRouteInfo<void> {
  const SignRouter({List<_i7.PageRouteInfo>? children})
      : super(SignRouter.name, path: '/sign', initialChildren: children);

  static const String name = 'SignRouter';
}

/// generated route for
/// [_i3.LoadingPage]
class LoadingRoute extends _i7.PageRouteInfo<void> {
  const LoadingRoute() : super(LoadingRoute.name, path: '');

  static const String name = 'LoadingRoute';
}

/// generated route for
/// [_i4.ProductDetailsPage]
class ProductDetailsRoute extends _i7.PageRouteInfo<ProductDetailsRouteArgs> {
  ProductDetailsRoute({required String id, _i19.Key? key, _i20.XProduct? data})
      : super(ProductDetailsRoute.name,
            path: '/detail/:id',
            args: ProductDetailsRouteArgs(id: id, key: key, data: data),
            rawPathParams: {'id': id});

  static const String name = 'ProductDetailsRoute';
}

class ProductDetailsRouteArgs {
  const ProductDetailsRouteArgs({required this.id, this.key, this.data});

  final String id;

  final _i19.Key? key;

  final _i20.XProduct? data;

  @override
  String toString() {
    return 'ProductDetailsRouteArgs{id: $id, key: $key, data: $data}';
  }
}

/// generated route for
/// [_i5.DashboardPage]
class DashboardRoute extends _i7.PageRouteInfo<void> {
  const DashboardRoute({List<_i7.PageRouteInfo>? children})
      : super(DashboardRoute.name, path: '', initialChildren: children);

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i6.HomePage]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: 'home');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i7.EmptyRouterPage]
class ShopTab extends _i7.PageRouteInfo<void> {
  const ShopTab({List<_i7.PageRouteInfo>? children})
      : super(ShopTab.name, path: 'shop', initialChildren: children);

  static const String name = 'ShopTab';
}

/// generated route for
/// [_i8.BagPage]
class BagRoute extends _i7.PageRouteInfo<void> {
  const BagRoute() : super(BagRoute.name, path: 'bag');

  static const String name = 'BagRoute';
}

/// generated route for
/// [_i7.EmptyRouterPage]
class FavoritesTab extends _i7.PageRouteInfo<void> {
  const FavoritesTab({List<_i7.PageRouteInfo>? children})
      : super(FavoritesTab.name, path: 'favorites', initialChildren: children);

  static const String name = 'FavoritesTab';
}

/// generated route for
/// [_i7.EmptyRouterPage]
class ProfileTab extends _i7.PageRouteInfo<void> {
  const ProfileTab({List<_i7.PageRouteInfo>? children})
      : super(ProfileTab.name, path: 'profile', initialChildren: children);

  static const String name = 'ProfileTab';
}

/// generated route for
/// [_i9.ShopPage]
class ShopRoute extends _i7.PageRouteInfo<void> {
  const ShopRoute() : super(ShopRoute.name, path: '');

  static const String name = 'ShopRoute';
}

/// generated route for
/// [_i10.DetailCategoryPage]
class DetailCategoryRoute extends _i7.PageRouteInfo<DetailCategoryRouteArgs> {
  DetailCategoryRoute(
      {_i19.Key? key, required String idCategory, required String nameCategory})
      : super(DetailCategoryRoute.name,
            path: 'productByCategory',
            args: DetailCategoryRouteArgs(
                key: key, idCategory: idCategory, nameCategory: nameCategory));

  static const String name = 'DetailCategoryRoute';
}

class DetailCategoryRouteArgs {
  const DetailCategoryRouteArgs(
      {this.key, required this.idCategory, required this.nameCategory});

  final _i19.Key? key;

  final String idCategory;

  final String nameCategory;

  @override
  String toString() {
    return 'DetailCategoryRouteArgs{key: $key, idCategory: $idCategory, nameCategory: $nameCategory}';
  }
}

/// generated route for
/// [_i11.SearchProductsByCategoryPage]
class SearchProductsByCategoryRoute extends _i7.PageRouteInfo<void> {
  const SearchProductsByCategoryRoute()
      : super(SearchProductsByCategoryRoute.name,
            path: 'searchProductsByCategoryPage');

  static const String name = 'SearchProductsByCategoryRoute';
}

/// generated route for
/// [_i12.FavoritesPage]
class FavoritesRoute extends _i7.PageRouteInfo<void> {
  const FavoritesRoute() : super(FavoritesRoute.name, path: '');

  static const String name = 'FavoritesRoute';
}

/// generated route for
/// [_i13.SearchFavoritePage]
class SearchFavoriteRoute extends _i7.PageRouteInfo<void> {
  const SearchFavoriteRoute()
      : super(SearchFavoriteRoute.name, path: 'searchProductsByFavoritePage');

  static const String name = 'SearchFavoriteRoute';
}

/// generated route for
/// [_i14.ProfilePage]
class ProfileRoute extends _i7.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: '');

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i15.SettingPage]
class SettingRoute extends _i7.PageRouteInfo<void> {
  const SettingRoute() : super(SettingRoute.name, path: 'setting');

  static const String name = 'SettingRoute';
}

/// generated route for
/// [_i16.LoginPage]
class LoginRoute extends _i7.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: 'login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i17.SignUpPage]
class SignUpRoute extends _i7.PageRouteInfo<void> {
  const SignUpRoute() : super(SignUpRoute.name, path: 'register');

  static const String name = 'SignUpRoute';
}
