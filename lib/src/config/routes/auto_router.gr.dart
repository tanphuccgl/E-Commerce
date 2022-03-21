// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i19;

import '../../models/products_model.dart' as _i20;
import '../../modules/auth/login/pages/login_page.dart' as _i15;
import '../../modules/auth/login/router/sign_wrapper_router.dart' as _i2;
import '../../modules/auth/sign_up/pages/sign_up_page.dart' as _i16;
import '../../modules/cart/pages/cart_page.dart' as _i10;
import '../../modules/dashboard/pages/dashboard_page.dart' as _i5;
import '../../modules/dashboard/router/dashboard_wrapper_router.dart' as _i1;
import '../../modules/detail_category/pages/detail_category_page.dart' as _i8;
import '../../modules/detail_category/pages/search_products_page.dart' as _i9;
import '../../modules/favorites/pages/favorites_page.dart' as _i11;
import '../../modules/favorites/pages/search_favorite_page.dart' as _i12;
import '../../modules/home/pages/home_page.dart' as _i6;
import '../../modules/loading/pages/loading_page.dart' as _i3;
import '../../modules/product_details/pages/product_details_page.dart' as _i17;
import '../../modules/profile/pages/profile_page.dart' as _i13;
import '../../modules/rating_and_review/pages/rating_page.dart' as _i18;
import '../../modules/settings/pages/setting_page.dart' as _i14;
import '../../modules/shop/pages/shop_page.dart' as _i7;

class XRouter extends _i4.RootStackRouter {
  XRouter([_i19.GlobalKey<_i19.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    DashboardWrapperRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.DashboardWrapperPage());
    },
    SignRouter.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.SignWrapperPage());
    },
    LoadingRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.LoadingPage());
    },
    Detail.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.EmptyRouterPage());
    },
    DashboardRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.DashboardPage());
    },
    HomeRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.HomePage());
    },
    ShopTab.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.EmptyRouterPage());
    },
    BagTab.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.EmptyRouterPage());
    },
    FavoritesTab.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.EmptyRouterPage());
    },
    ProfileTab.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.EmptyRouterPage());
    },
    ShopRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.ShopPage());
    },
    DetailCategoryRoute.name: (routeData) {
      final args = routeData.argsAs<DetailCategoryRouteArgs>();
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i8.DetailCategoryPage(
              key: args.key,
              idCategory: args.idCategory,
              nameCategory: args.nameCategory));
    },
    SearchProductsByCategoryRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData,
          child: const _i9.SearchProductsByCategoryPage());
    },
    BagRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.BagPage());
    },
    FavoritesRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.FavoritesPage());
    },
    SearchFavoriteRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.SearchFavoritePage());
    },
    ProfileRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.ProfilePage());
    },
    SettingRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i14.SettingPage());
    },
    LoginRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i15.LoginPage());
    },
    SignUpRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i16.SignUpPage());
    },
    ProductDetailsRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ProductDetailsRouteArgs>(
          orElse: () =>
              ProductDetailsRouteArgs(id: pathParams.getString('id')));
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i17.ProductDetailsPage(
              id: args.id, key: args.key, data: args.data));
    },
    RatingRoute.name: (routeData) {
      final args = routeData.argsAs<RatingRouteArgs>();
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i18.RatingPage(key: args.key, data: args.data));
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig('/#redirect',
            path: '/', redirectTo: '', fullMatch: true),
        _i4.RouteConfig(DashboardWrapperRoute.name,
            path: '/dashboard',
            children: [
              _i4.RouteConfig(DashboardRoute.name,
                  path: '',
                  parent: DashboardWrapperRoute.name,
                  children: [
                    _i4.RouteConfig(HomeRoute.name,
                        path: 'home', parent: DashboardRoute.name),
                    _i4.RouteConfig(ShopTab.name,
                        path: 'shop',
                        parent: DashboardRoute.name,
                        children: [
                          _i4.RouteConfig(ShopRoute.name,
                              path: '', parent: ShopTab.name),
                          _i4.RouteConfig(DetailCategoryRoute.name,
                              path: 'productByCategory', parent: ShopTab.name),
                          _i4.RouteConfig(SearchProductsByCategoryRoute.name,
                              path: 'searchProductsByCategoryPage',
                              parent: ShopTab.name),
                          _i4.RouteConfig('*#redirect',
                              path: '*',
                              parent: ShopTab.name,
                              redirectTo: '',
                              fullMatch: true)
                        ]),
                    _i4.RouteConfig(BagTab.name,
                        path: 'bag',
                        parent: DashboardRoute.name,
                        children: [
                          _i4.RouteConfig(BagRoute.name,
                              path: '', parent: BagTab.name),
                          _i4.RouteConfig('*#redirect',
                              path: '*',
                              parent: BagTab.name,
                              redirectTo: '',
                              fullMatch: true)
                        ]),
                    _i4.RouteConfig(FavoritesTab.name,
                        path: 'favorites',
                        parent: DashboardRoute.name,
                        children: [
                          _i4.RouteConfig(FavoritesRoute.name,
                              path: '', parent: FavoritesTab.name),
                          _i4.RouteConfig(SearchFavoriteRoute.name,
                              path: 'searchProductsByFavoritePage',
                              parent: FavoritesTab.name),
                          _i4.RouteConfig('*#redirect',
                              path: '*',
                              parent: FavoritesTab.name,
                              redirectTo: '',
                              fullMatch: true)
                        ]),
                    _i4.RouteConfig(ProfileTab.name,
                        path: 'profile',
                        parent: DashboardRoute.name,
                        children: [
                          _i4.RouteConfig(ProfileRoute.name,
                              path: '', parent: ProfileTab.name),
                          _i4.RouteConfig(SettingRoute.name,
                              path: 'setting', parent: ProfileTab.name),
                          _i4.RouteConfig('*#redirect',
                              path: '*',
                              parent: ProfileTab.name,
                              redirectTo: '',
                              fullMatch: true)
                        ]),
                    _i4.RouteConfig('*#redirect',
                        path: '*',
                        parent: DashboardRoute.name,
                        redirectTo: '',
                        fullMatch: true)
                  ]),
              _i4.RouteConfig('*#redirect',
                  path: '*',
                  parent: DashboardWrapperRoute.name,
                  redirectTo: '',
                  fullMatch: true)
            ]),
        _i4.RouteConfig(SignRouter.name, path: '/sign', children: [
          _i4.RouteConfig('#redirect',
              path: '',
              parent: SignRouter.name,
              redirectTo: 'register',
              fullMatch: true),
          _i4.RouteConfig(LoginRoute.name,
              path: 'login', parent: SignRouter.name),
          _i4.RouteConfig(SignUpRoute.name,
              path: 'register', parent: SignRouter.name),
          _i4.RouteConfig('*#redirect',
              path: '*',
              parent: SignRouter.name,
              redirectTo: '',
              fullMatch: true)
        ]),
        _i4.RouteConfig(LoadingRoute.name, path: ''),
        _i4.RouteConfig(Detail.name, path: '/detail/:id', children: [
          _i4.RouteConfig(ProductDetailsRoute.name,
              path: '', parent: Detail.name),
          _i4.RouteConfig(RatingRoute.name,
              path: 'rating', parent: Detail.name),
          _i4.RouteConfig('*#redirect',
              path: '*', parent: Detail.name, redirectTo: '', fullMatch: true)
        ]),
        _i4.RouteConfig('*#redirect',
            path: '*', redirectTo: '', fullMatch: true)
      ];
}

/// generated route for
/// [_i1.DashboardWrapperPage]
class DashboardWrapperRoute extends _i4.PageRouteInfo<void> {
  const DashboardWrapperRoute({List<_i4.PageRouteInfo>? children})
      : super(DashboardWrapperRoute.name,
            path: '/dashboard', initialChildren: children);

  static const String name = 'DashboardWrapperRoute';
}

/// generated route for
/// [_i2.SignWrapperPage]
class SignRouter extends _i4.PageRouteInfo<void> {
  const SignRouter({List<_i4.PageRouteInfo>? children})
      : super(SignRouter.name, path: '/sign', initialChildren: children);

  static const String name = 'SignRouter';
}

/// generated route for
/// [_i3.LoadingPage]
class LoadingRoute extends _i4.PageRouteInfo<void> {
  const LoadingRoute() : super(LoadingRoute.name, path: '');

  static const String name = 'LoadingRoute';
}

/// generated route for
/// [_i4.EmptyRouterPage]
class Detail extends _i4.PageRouteInfo<void> {
  const Detail({List<_i4.PageRouteInfo>? children})
      : super(Detail.name, path: '/detail/:id', initialChildren: children);

  static const String name = 'Detail';
}

/// generated route for
/// [_i5.DashboardPage]
class DashboardRoute extends _i4.PageRouteInfo<void> {
  const DashboardRoute({List<_i4.PageRouteInfo>? children})
      : super(DashboardRoute.name, path: '', initialChildren: children);

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i6.HomePage]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: 'home');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i4.EmptyRouterPage]
class ShopTab extends _i4.PageRouteInfo<void> {
  const ShopTab({List<_i4.PageRouteInfo>? children})
      : super(ShopTab.name, path: 'shop', initialChildren: children);

  static const String name = 'ShopTab';
}

/// generated route for
/// [_i4.EmptyRouterPage]
class BagTab extends _i4.PageRouteInfo<void> {
  const BagTab({List<_i4.PageRouteInfo>? children})
      : super(BagTab.name, path: 'bag', initialChildren: children);

  static const String name = 'BagTab';
}

/// generated route for
/// [_i4.EmptyRouterPage]
class FavoritesTab extends _i4.PageRouteInfo<void> {
  const FavoritesTab({List<_i4.PageRouteInfo>? children})
      : super(FavoritesTab.name, path: 'favorites', initialChildren: children);

  static const String name = 'FavoritesTab';
}

/// generated route for
/// [_i4.EmptyRouterPage]
class ProfileTab extends _i4.PageRouteInfo<void> {
  const ProfileTab({List<_i4.PageRouteInfo>? children})
      : super(ProfileTab.name, path: 'profile', initialChildren: children);

  static const String name = 'ProfileTab';
}

/// generated route for
/// [_i7.ShopPage]
class ShopRoute extends _i4.PageRouteInfo<void> {
  const ShopRoute() : super(ShopRoute.name, path: '');

  static const String name = 'ShopRoute';
}

/// generated route for
/// [_i8.DetailCategoryPage]
class DetailCategoryRoute extends _i4.PageRouteInfo<DetailCategoryRouteArgs> {
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
/// [_i9.SearchProductsByCategoryPage]
class SearchProductsByCategoryRoute extends _i4.PageRouteInfo<void> {
  const SearchProductsByCategoryRoute()
      : super(SearchProductsByCategoryRoute.name,
            path: 'searchProductsByCategoryPage');

  static const String name = 'SearchProductsByCategoryRoute';
}

/// generated route for
/// [_i10.BagPage]
class BagRoute extends _i4.PageRouteInfo<void> {
  const BagRoute() : super(BagRoute.name, path: '');

  static const String name = 'BagRoute';
}

/// generated route for
/// [_i11.FavoritesPage]
class FavoritesRoute extends _i4.PageRouteInfo<void> {
  const FavoritesRoute() : super(FavoritesRoute.name, path: '');

  static const String name = 'FavoritesRoute';
}

/// generated route for
/// [_i12.SearchFavoritePage]
class SearchFavoriteRoute extends _i4.PageRouteInfo<void> {
  const SearchFavoriteRoute()
      : super(SearchFavoriteRoute.name, path: 'searchProductsByFavoritePage');

  static const String name = 'SearchFavoriteRoute';
}

/// generated route for
/// [_i13.ProfilePage]
class ProfileRoute extends _i4.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: '');

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i14.SettingPage]
class SettingRoute extends _i4.PageRouteInfo<void> {
  const SettingRoute() : super(SettingRoute.name, path: 'setting');

  static const String name = 'SettingRoute';
}

/// generated route for
/// [_i15.LoginPage]
class LoginRoute extends _i4.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: 'login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i16.SignUpPage]
class SignUpRoute extends _i4.PageRouteInfo<void> {
  const SignUpRoute() : super(SignUpRoute.name, path: 'register');

  static const String name = 'SignUpRoute';
}

/// generated route for
/// [_i17.ProductDetailsPage]
class ProductDetailsRoute extends _i4.PageRouteInfo<ProductDetailsRouteArgs> {
  ProductDetailsRoute({required String id, _i19.Key? key, _i20.XProduct? data})
      : super(ProductDetailsRoute.name,
            path: '',
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
/// [_i18.RatingPage]
class RatingRoute extends _i4.PageRouteInfo<RatingRouteArgs> {
  RatingRoute({_i19.Key? key, required _i20.XProduct data})
      : super(RatingRoute.name,
            path: 'rating', args: RatingRouteArgs(key: key, data: data));

  static const String name = 'RatingRoute';
}

class RatingRouteArgs {
  const RatingRouteArgs({this.key, required this.data});

  final _i19.Key? key;

  final _i20.XProduct data;

  @override
  String toString() {
    return 'RatingRouteArgs{key: $key, data: $data}';
  }
}
