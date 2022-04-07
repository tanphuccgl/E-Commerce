// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/cupertino.dart' as _i28;
import 'package:flutter/material.dart' as _i26;

import '../../models/products_model.dart' as _i27;
import '../../modules/auth/login/pages/login_page.dart' as _i24;
import '../../modules/auth/login/router/sign_wrapper_router.dart' as _i2;
import '../../modules/auth/sign_up/pages/sign_up_page.dart' as _i25;
import '../../modules/cart/pages/cart_page.dart' as _i16;
import '../../modules/checkout/pages/checkout_page.dart' as _i17;
import '../../modules/dashboard/pages/dashboard_page.dart' as _i4;
import '../../modules/dashboard/router/dashboard_wrapper_router.dart' as _i1;
import '../../modules/detail_category/pages/detail_category_page.dart' as _i14;
import '../../modules/detail_category/pages/search_products_page.dart' as _i15;
import '../../modules/favorites/pages/favorites_page.dart' as _i18;
import '../../modules/favorites/pages/search_favorite_page.dart' as _i19;
import '../../modules/home/pages/home_page.dart' as _i11;
import '../../modules/home/router/home_wrapper_router.dart' as _i9;
import '../../modules/loading/pages/loading_page.dart' as _i3;
import '../../modules/payment_method/pages/payment_method_page.dart' as _i6;
import '../../modules/product_details/pages/product_details_page.dart' as _i22;
import '../../modules/product_details/router/product_details_wrapper_router.dart'
    as _i5;
import '../../modules/profile/pages/profile_page.dart' as _i20;
import '../../modules/review/pages/review_page.dart' as _i23;
import '../../modules/settings/pages/setting_page.dart' as _i21;
import '../../modules/shipping_address/shipping_addresses/pages/shipping_addresses_page.dart'
    as _i7;
import '../../modules/shop/pages/shop_page.dart' as _i13;
import '../../modules/success/pages/success_page.dart' as _i8;
import '../../modules/view_all_products/pages/view_all_products_page.dart'
    as _i12;
import '../../utils/enum/product_type.dart' as _i29;

class XRouter extends _i10.RootStackRouter {
  XRouter([_i26.GlobalKey<_i26.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    DashboardWrapperRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.DashboardWrapperPage());
    },
    SignRouter.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.SignWrapperPage());
    },
    LoadingRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.LoadingPage());
    },
    DashboardRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.DashboardPage());
    },
    ProductDetailsWrapperRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ProductDetailsWrapperRouteArgs>(
          orElse: () =>
              ProductDetailsWrapperRouteArgs(id: pathParams.getString('id')));
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i5.ProductDetailsWrapperPage(
              id: args.id, data: args.data, key: args.key));
    },
    PaymentMethodRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.PaymentMethodPage());
    },
    ShippingAddressesRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.ShippingAddressesPage());
    },
    SuccessRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.SuccessPage());
    },
    HomeTab.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.HomeWrapperPage());
    },
    ShopTab.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.EmptyRouterPage());
    },
    CartTab.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.EmptyRouterPage());
    },
    FavoritesTab.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.EmptyRouterPage());
    },
    ProfileTab.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.EmptyRouterPage());
    },
    HomeRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.HomePage());
    },
    ViewAllRoute.name: (routeData) {
      final args = routeData.argsAs<ViewAllRouteArgs>();
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i12.ViewAllProductsPage(
              key: args.key, productType: args.productType));
    },
    ShopRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.ShopPage());
    },
    DetailCategoryRoute.name: (routeData) {
      final args = routeData.argsAs<DetailCategoryRouteArgs>();
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i14.DetailCategoryPage(
              key: args.key,
              idCategory: args.idCategory,
              nameCategory: args.nameCategory));
    },
    SearchProductsByCategoryRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData,
          child: const _i15.SearchProductsByCategoryPage());
    },
    CartRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i16.CartPage());
    },
    CheckoutRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i17.CheckoutPage());
    },
    FavoritesRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i18.FavoritesPage());
    },
    SearchFavoriteRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i19.SearchFavoritePage());
    },
    ProfileRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i20.ProfilePage());
    },
    SettingRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i21.SettingPage());
    },
    ProductDetailsRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i22.ProductDetailsPage());
    },
    ReviewRoute.name: (routeData) {
      final args = routeData.argsAs<ReviewRouteArgs>();
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i23.ReviewPage(key: args.key, data: args.data));
    },
    LoginRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i24.LoginPage());
    },
    SignUpRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i25.SignUpPage());
    }
  };

  @override
  List<_i10.RouteConfig> get routes => [
        _i10.RouteConfig('/#redirect',
            path: '/', redirectTo: '', fullMatch: true),
        _i10.RouteConfig(DashboardWrapperRoute.name,
            path: '/dashboard',
            children: [
              _i10.RouteConfig(DashboardRoute.name,
                  path: '',
                  parent: DashboardWrapperRoute.name,
                  children: [
                    _i10.RouteConfig(HomeTab.name,
                        path: 'home',
                        parent: DashboardRoute.name,
                        children: [
                          _i10.RouteConfig(HomeRoute.name,
                              path: '', parent: HomeTab.name),
                          _i10.RouteConfig(ViewAllRoute.name,
                              path: 'view_all', parent: HomeTab.name),
                          _i10.RouteConfig('*#redirect',
                              path: '*',
                              parent: HomeTab.name,
                              redirectTo: '',
                              fullMatch: true)
                        ]),
                    _i10.RouteConfig(ShopTab.name,
                        path: 'shop',
                        parent: DashboardRoute.name,
                        children: [
                          _i10.RouteConfig(ShopRoute.name,
                              path: '', parent: ShopTab.name),
                          _i10.RouteConfig(DetailCategoryRoute.name,
                              path: 'product_by_category',
                              parent: ShopTab.name),
                          _i10.RouteConfig(SearchProductsByCategoryRoute.name,
                              path: 'search_products_by_category',
                              parent: ShopTab.name),
                          _i10.RouteConfig('*#redirect',
                              path: '*',
                              parent: ShopTab.name,
                              redirectTo: '',
                              fullMatch: true)
                        ]),
                    _i10.RouteConfig(CartTab.name,
                        path: 'cart',
                        parent: DashboardRoute.name,
                        children: [
                          _i10.RouteConfig(CartRoute.name,
                              path: '', parent: CartTab.name),
                          _i10.RouteConfig(CheckoutRoute.name,
                              path: 'checkout', parent: CartTab.name),
                          _i10.RouteConfig('*#redirect',
                              path: '*',
                              parent: CartTab.name,
                              redirectTo: '',
                              fullMatch: true)
                        ]),
                    _i10.RouteConfig(FavoritesTab.name,
                        path: 'favorites',
                        parent: DashboardRoute.name,
                        children: [
                          _i10.RouteConfig(FavoritesRoute.name,
                              path: '', parent: FavoritesTab.name),
                          _i10.RouteConfig(SearchFavoriteRoute.name,
                              path: 'search_products_by_favorite',
                              parent: FavoritesTab.name),
                          _i10.RouteConfig('*#redirect',
                              path: '*',
                              parent: FavoritesTab.name,
                              redirectTo: '',
                              fullMatch: true)
                        ]),
                    _i10.RouteConfig(ProfileTab.name,
                        path: 'profile',
                        parent: DashboardRoute.name,
                        children: [
                          _i10.RouteConfig(ProfileRoute.name,
                              path: '', parent: ProfileTab.name),
                          _i10.RouteConfig(SettingRoute.name,
                              path: 'setting', parent: ProfileTab.name),
                          _i10.RouteConfig('*#redirect',
                              path: '*',
                              parent: ProfileTab.name,
                              redirectTo: '',
                              fullMatch: true)
                        ]),
                    _i10.RouteConfig('*#redirect',
                        path: '*',
                        parent: DashboardRoute.name,
                        redirectTo: '',
                        fullMatch: true)
                  ]),
              _i10.RouteConfig(ProductDetailsWrapperRoute.name,
                  path: 'product/:id',
                  parent: DashboardWrapperRoute.name,
                  children: [
                    _i10.RouteConfig(ProductDetailsRoute.name,
                        path: '', parent: ProductDetailsWrapperRoute.name),
                    _i10.RouteConfig(ReviewRoute.name,
                        path: 'review',
                        parent: ProductDetailsWrapperRoute.name),
                    _i10.RouteConfig('*#redirect',
                        path: '*',
                        parent: ProductDetailsWrapperRoute.name,
                        redirectTo: '',
                        fullMatch: true)
                  ]),
              _i10.RouteConfig(PaymentMethodRoute.name,
                  path: 'payment_method', parent: DashboardWrapperRoute.name),
              _i10.RouteConfig(ShippingAddressesRoute.name,
                  path: 'shipping_address', parent: DashboardWrapperRoute.name),
              _i10.RouteConfig(SuccessRoute.name,
                  path: 'success', parent: DashboardWrapperRoute.name),
              _i10.RouteConfig('*#redirect',
                  path: '*',
                  parent: DashboardWrapperRoute.name,
                  redirectTo: '',
                  fullMatch: true)
            ]),
        _i10.RouteConfig(SignRouter.name, path: '/sign', children: [
          _i10.RouteConfig('#redirect',
              path: '',
              parent: SignRouter.name,
              redirectTo: 'register',
              fullMatch: true),
          _i10.RouteConfig(LoginRoute.name,
              path: 'login', parent: SignRouter.name),
          _i10.RouteConfig(SignUpRoute.name,
              path: 'register', parent: SignRouter.name),
          _i10.RouteConfig('*#redirect',
              path: '*',
              parent: SignRouter.name,
              redirectTo: '',
              fullMatch: true)
        ]),
        _i10.RouteConfig(LoadingRoute.name, path: ''),
        _i10.RouteConfig('*#redirect',
            path: '*', redirectTo: '', fullMatch: true)
      ];
}

/// generated route for
/// [_i1.DashboardWrapperPage]
class DashboardWrapperRoute extends _i10.PageRouteInfo<void> {
  const DashboardWrapperRoute({List<_i10.PageRouteInfo>? children})
      : super(DashboardWrapperRoute.name,
            path: '/dashboard', initialChildren: children);

  static const String name = 'DashboardWrapperRoute';
}

/// generated route for
/// [_i2.SignWrapperPage]
class SignRouter extends _i10.PageRouteInfo<void> {
  const SignRouter({List<_i10.PageRouteInfo>? children})
      : super(SignRouter.name, path: '/sign', initialChildren: children);

  static const String name = 'SignRouter';
}

/// generated route for
/// [_i3.LoadingPage]
class LoadingRoute extends _i10.PageRouteInfo<void> {
  const LoadingRoute() : super(LoadingRoute.name, path: '');

  static const String name = 'LoadingRoute';
}

/// generated route for
/// [_i4.DashboardPage]
class DashboardRoute extends _i10.PageRouteInfo<void> {
  const DashboardRoute({List<_i10.PageRouteInfo>? children})
      : super(DashboardRoute.name, path: '', initialChildren: children);

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i5.ProductDetailsWrapperPage]
class ProductDetailsWrapperRoute
    extends _i10.PageRouteInfo<ProductDetailsWrapperRouteArgs> {
  ProductDetailsWrapperRoute(
      {required String id,
      _i27.XProduct? data,
      _i28.Key? key,
      List<_i10.PageRouteInfo>? children})
      : super(ProductDetailsWrapperRoute.name,
            path: 'product/:id',
            args: ProductDetailsWrapperRouteArgs(id: id, data: data, key: key),
            rawPathParams: {'id': id},
            initialChildren: children);

  static const String name = 'ProductDetailsWrapperRoute';
}

class ProductDetailsWrapperRouteArgs {
  const ProductDetailsWrapperRouteArgs({required this.id, this.data, this.key});

  final String id;

  final _i27.XProduct? data;

  final _i28.Key? key;

  @override
  String toString() {
    return 'ProductDetailsWrapperRouteArgs{id: $id, data: $data, key: $key}';
  }
}

/// generated route for
/// [_i6.PaymentMethodPage]
class PaymentMethodRoute extends _i10.PageRouteInfo<void> {
  const PaymentMethodRoute()
      : super(PaymentMethodRoute.name, path: 'payment_method');

  static const String name = 'PaymentMethodRoute';
}

/// generated route for
/// [_i7.ShippingAddressesPage]
class ShippingAddressesRoute extends _i10.PageRouteInfo<void> {
  const ShippingAddressesRoute()
      : super(ShippingAddressesRoute.name, path: 'shipping_address');

  static const String name = 'ShippingAddressesRoute';
}

/// generated route for
/// [_i8.SuccessPage]
class SuccessRoute extends _i10.PageRouteInfo<void> {
  const SuccessRoute() : super(SuccessRoute.name, path: 'success');

  static const String name = 'SuccessRoute';
}

/// generated route for
/// [_i9.HomeWrapperPage]
class HomeTab extends _i10.PageRouteInfo<void> {
  const HomeTab({List<_i10.PageRouteInfo>? children})
      : super(HomeTab.name, path: 'home', initialChildren: children);

  static const String name = 'HomeTab';
}

/// generated route for
/// [_i10.EmptyRouterPage]
class ShopTab extends _i10.PageRouteInfo<void> {
  const ShopTab({List<_i10.PageRouteInfo>? children})
      : super(ShopTab.name, path: 'shop', initialChildren: children);

  static const String name = 'ShopTab';
}

/// generated route for
/// [_i10.EmptyRouterPage]
class CartTab extends _i10.PageRouteInfo<void> {
  const CartTab({List<_i10.PageRouteInfo>? children})
      : super(CartTab.name, path: 'cart', initialChildren: children);

  static const String name = 'CartTab';
}

/// generated route for
/// [_i10.EmptyRouterPage]
class FavoritesTab extends _i10.PageRouteInfo<void> {
  const FavoritesTab({List<_i10.PageRouteInfo>? children})
      : super(FavoritesTab.name, path: 'favorites', initialChildren: children);

  static const String name = 'FavoritesTab';
}

/// generated route for
/// [_i10.EmptyRouterPage]
class ProfileTab extends _i10.PageRouteInfo<void> {
  const ProfileTab({List<_i10.PageRouteInfo>? children})
      : super(ProfileTab.name, path: 'profile', initialChildren: children);

  static const String name = 'ProfileTab';
}

/// generated route for
/// [_i11.HomePage]
class HomeRoute extends _i10.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i12.ViewAllProductsPage]
class ViewAllRoute extends _i10.PageRouteInfo<ViewAllRouteArgs> {
  ViewAllRoute({_i28.Key? key, required _i29.ProductType productType})
      : super(ViewAllRoute.name,
            path: 'view_all',
            args: ViewAllRouteArgs(key: key, productType: productType));

  static const String name = 'ViewAllRoute';
}

class ViewAllRouteArgs {
  const ViewAllRouteArgs({this.key, required this.productType});

  final _i28.Key? key;

  final _i29.ProductType productType;

  @override
  String toString() {
    return 'ViewAllRouteArgs{key: $key, productType: $productType}';
  }
}

/// generated route for
/// [_i13.ShopPage]
class ShopRoute extends _i10.PageRouteInfo<void> {
  const ShopRoute() : super(ShopRoute.name, path: '');

  static const String name = 'ShopRoute';
}

/// generated route for
/// [_i14.DetailCategoryPage]
class DetailCategoryRoute extends _i10.PageRouteInfo<DetailCategoryRouteArgs> {
  DetailCategoryRoute(
      {_i28.Key? key, required String idCategory, required String nameCategory})
      : super(DetailCategoryRoute.name,
            path: 'product_by_category',
            args: DetailCategoryRouteArgs(
                key: key, idCategory: idCategory, nameCategory: nameCategory));

  static const String name = 'DetailCategoryRoute';
}

class DetailCategoryRouteArgs {
  const DetailCategoryRouteArgs(
      {this.key, required this.idCategory, required this.nameCategory});

  final _i28.Key? key;

  final String idCategory;

  final String nameCategory;

  @override
  String toString() {
    return 'DetailCategoryRouteArgs{key: $key, idCategory: $idCategory, nameCategory: $nameCategory}';
  }
}

/// generated route for
/// [_i15.SearchProductsByCategoryPage]
class SearchProductsByCategoryRoute extends _i10.PageRouteInfo<void> {
  const SearchProductsByCategoryRoute()
      : super(SearchProductsByCategoryRoute.name,
            path: 'search_products_by_category');

  static const String name = 'SearchProductsByCategoryRoute';
}

/// generated route for
/// [_i16.CartPage]
class CartRoute extends _i10.PageRouteInfo<void> {
  const CartRoute() : super(CartRoute.name, path: '');

  static const String name = 'CartRoute';
}

/// generated route for
/// [_i17.CheckoutPage]
class CheckoutRoute extends _i10.PageRouteInfo<void> {
  const CheckoutRoute() : super(CheckoutRoute.name, path: 'checkout');

  static const String name = 'CheckoutRoute';
}

/// generated route for
/// [_i18.FavoritesPage]
class FavoritesRoute extends _i10.PageRouteInfo<void> {
  const FavoritesRoute() : super(FavoritesRoute.name, path: '');

  static const String name = 'FavoritesRoute';
}

/// generated route for
/// [_i19.SearchFavoritePage]
class SearchFavoriteRoute extends _i10.PageRouteInfo<void> {
  const SearchFavoriteRoute()
      : super(SearchFavoriteRoute.name, path: 'search_products_by_favorite');

  static const String name = 'SearchFavoriteRoute';
}

/// generated route for
/// [_i20.ProfilePage]
class ProfileRoute extends _i10.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: '');

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i21.SettingPage]
class SettingRoute extends _i10.PageRouteInfo<void> {
  const SettingRoute() : super(SettingRoute.name, path: 'setting');

  static const String name = 'SettingRoute';
}

/// generated route for
/// [_i22.ProductDetailsPage]
class ProductDetailsRoute extends _i10.PageRouteInfo<void> {
  const ProductDetailsRoute() : super(ProductDetailsRoute.name, path: '');

  static const String name = 'ProductDetailsRoute';
}

/// generated route for
/// [_i23.ReviewPage]
class ReviewRoute extends _i10.PageRouteInfo<ReviewRouteArgs> {
  ReviewRoute({_i28.Key? key, required _i27.XProduct data})
      : super(ReviewRoute.name,
            path: 'review', args: ReviewRouteArgs(key: key, data: data));

  static const String name = 'ReviewRoute';
}

class ReviewRouteArgs {
  const ReviewRouteArgs({this.key, required this.data});

  final _i28.Key? key;

  final _i27.XProduct data;

  @override
  String toString() {
    return 'ReviewRouteArgs{key: $key, data: $data}';
  }
}

/// generated route for
/// [_i24.LoginPage]
class LoginRoute extends _i10.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: 'login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i25.SignUpPage]
class SignUpRoute extends _i10.PageRouteInfo<void> {
  const SignUpRoute() : super(SignUpRoute.name, path: 'register');

  static const String name = 'SignUpRoute';
}
