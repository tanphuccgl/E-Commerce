// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i27;

import '../../models/products_model.dart' as _i28;
import '../../modules/auth/login/pages/login_page.dart' as _i25;
import '../../modules/auth/login/router/sign_wrapper_router.dart' as _i2;
import '../../modules/auth/sign_up/pages/sign_up_page.dart' as _i26;
import '../../modules/cart/pages/cart_page.dart' as _i15;
import '../../modules/checkout/pages/checkout_page.dart' as _i16;
import '../../modules/dashboard/pages/dashboard_page.dart' as _i4;
import '../../modules/dashboard/router/dashboard_wrapper_router.dart' as _i1;
import '../../modules/detail_category/pages/detail_category_page.dart' as _i13;
import '../../modules/detail_category/pages/search_products_page.dart' as _i14;
import '../../modules/favorites/pages/favorites_page.dart' as _i17;
import '../../modules/favorites/pages/search_favorite_page.dart' as _i18;
import '../../modules/home/pages/home_page.dart' as _i10;
import '../../modules/home/router/home_wrapper_router.dart' as _i8;
import '../../modules/loading/pages/loading_page.dart' as _i3;
import '../../modules/payment_method/pages/payment_method_page.dart' as _i6;
import '../../modules/product_details/pages/product_details_page.dart' as _i21;
import '../../modules/product_details/router/product_details_wrapper_router.dart'
    as _i5;
import '../../modules/profile/pages/profile_page.dart' as _i19;
import '../../modules/review/pages/review_page.dart' as _i22;
import '../../modules/settings/pages/setting_page.dart' as _i20;
import '../../modules/shipping_address/adding_shipping_address/pages/adding_shipping_address_page.dart'
    as _i24;
import '../../modules/shipping_address/router/shipping_address_wrapper_router.dart'
    as _i7;
import '../../modules/shipping_address/shipping_addresses/pages/shipping_addresses_page.dart'
    as _i23;
import '../../modules/shop/pages/shop_page.dart' as _i12;
import '../../modules/view_all_products/pages/view_all_products_page.dart'
    as _i11;
import '../../utils/enum/product_type.dart' as _i29;

class XRouter extends _i9.RootStackRouter {
  XRouter([_i27.GlobalKey<_i27.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    DashboardWrapperRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.DashboardWrapperPage());
    },
    SignRouter.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.SignWrapperPage());
    },
    LoadingRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.LoadingPage());
    },
    DashboardRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.DashboardPage());
    },
    ProductDetailsWrapperRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ProductDetailsWrapperRouteArgs>(
          orElse: () =>
              ProductDetailsWrapperRouteArgs(id: pathParams.getString('id')));
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i5.ProductDetailsWrapperPage(
              id: args.id, data: args.data, key: args.key));
    },
    PaymentMethodRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.PaymentMethodPage());
    },
    ShippingAddressesWrapperRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.ShippingAddressWrapperPage());
    },
    HomeTab.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.HomeWrapperPage());
    },
    ShopTab.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.EmptyRouterPage());
    },
    CartTab.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.EmptyRouterPage());
    },
    FavoritesTab.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.EmptyRouterPage());
    },
    ProfileTab.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.EmptyRouterPage());
    },
    HomeRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.HomePage());
    },
    ViewAllRoute.name: (routeData) {
      final args = routeData.argsAs<ViewAllRouteArgs>();
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i11.ViewAllProductsPage(
              key: args.key, productType: args.productType));
    },
    ShopRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.ShopPage());
    },
    DetailCategoryRoute.name: (routeData) {
      final args = routeData.argsAs<DetailCategoryRouteArgs>();
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i13.DetailCategoryPage(
              key: args.key,
              idCategory: args.idCategory,
              nameCategory: args.nameCategory));
    },
    SearchProductsByCategoryRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData,
          child: const _i14.SearchProductsByCategoryPage());
    },
    CartRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i15.CartPage());
    },
    CheckoutRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i16.CheckoutPage());
    },
    FavoritesRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i17.FavoritesPage());
    },
    SearchFavoriteRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i18.SearchFavoritePage());
    },
    ProfileRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i19.ProfilePage());
    },
    SettingRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i20.SettingPage());
    },
    ProductDetailsRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i21.ProductDetailsPage());
    },
    ReviewRoute.name: (routeData) {
      final args = routeData.argsAs<ReviewRouteArgs>();
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i22.ReviewPage(key: args.key, data: args.data));
    },
    ShippingAddressesRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i23.ShippingAddressesPage());
    },
    AddShippingAddressRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i24.AddShippingAddressPage());
    },
    LoginRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i25.LoginPage());
    },
    SignUpRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i26.SignUpPage());
    }
  };

  @override
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig('/#redirect',
            path: '/', redirectTo: '', fullMatch: true),
        _i9.RouteConfig(DashboardWrapperRoute.name,
            path: '/dashboard',
            children: [
              _i9.RouteConfig(DashboardRoute.name,
                  path: '',
                  parent: DashboardWrapperRoute.name,
                  children: [
                    _i9.RouteConfig(HomeTab.name,
                        path: 'home',
                        parent: DashboardRoute.name,
                        children: [
                          _i9.RouteConfig(HomeRoute.name,
                              path: '', parent: HomeTab.name),
                          _i9.RouteConfig(ViewAllRoute.name,
                              path: 'view_all', parent: HomeTab.name),
                          _i9.RouteConfig('*#redirect',
                              path: '*',
                              parent: HomeTab.name,
                              redirectTo: '',
                              fullMatch: true)
                        ]),
                    _i9.RouteConfig(ShopTab.name,
                        path: 'shop',
                        parent: DashboardRoute.name,
                        children: [
                          _i9.RouteConfig(ShopRoute.name,
                              path: '', parent: ShopTab.name),
                          _i9.RouteConfig(DetailCategoryRoute.name,
                              path: 'product_by_category',
                              parent: ShopTab.name),
                          _i9.RouteConfig(SearchProductsByCategoryRoute.name,
                              path: 'search_products_by_category',
                              parent: ShopTab.name),
                          _i9.RouteConfig('*#redirect',
                              path: '*',
                              parent: ShopTab.name,
                              redirectTo: '',
                              fullMatch: true)
                        ]),
                    _i9.RouteConfig(CartTab.name,
                        path: 'cart',
                        parent: DashboardRoute.name,
                        children: [
                          _i9.RouteConfig(CartRoute.name,
                              path: '', parent: CartTab.name),
                          _i9.RouteConfig(CheckoutRoute.name,
                              path: 'checkout', parent: CartTab.name),
                          _i9.RouteConfig('*#redirect',
                              path: '*',
                              parent: CartTab.name,
                              redirectTo: '',
                              fullMatch: true)
                        ]),
                    _i9.RouteConfig(FavoritesTab.name,
                        path: 'favorites',
                        parent: DashboardRoute.name,
                        children: [
                          _i9.RouteConfig(FavoritesRoute.name,
                              path: '', parent: FavoritesTab.name),
                          _i9.RouteConfig(SearchFavoriteRoute.name,
                              path: 'search_products_by_favorite',
                              parent: FavoritesTab.name),
                          _i9.RouteConfig('*#redirect',
                              path: '*',
                              parent: FavoritesTab.name,
                              redirectTo: '',
                              fullMatch: true)
                        ]),
                    _i9.RouteConfig(ProfileTab.name,
                        path: 'profile',
                        parent: DashboardRoute.name,
                        children: [
                          _i9.RouteConfig(ProfileRoute.name,
                              path: '', parent: ProfileTab.name),
                          _i9.RouteConfig(SettingRoute.name,
                              path: 'setting', parent: ProfileTab.name),
                          _i9.RouteConfig('*#redirect',
                              path: '*',
                              parent: ProfileTab.name,
                              redirectTo: '',
                              fullMatch: true)
                        ]),
                    _i9.RouteConfig('*#redirect',
                        path: '*',
                        parent: DashboardRoute.name,
                        redirectTo: '',
                        fullMatch: true)
                  ]),
              _i9.RouteConfig(ProductDetailsWrapperRoute.name,
                  path: 'product/:id',
                  parent: DashboardWrapperRoute.name,
                  children: [
                    _i9.RouteConfig(ProductDetailsRoute.name,
                        path: '', parent: ProductDetailsWrapperRoute.name),
                    _i9.RouteConfig(ReviewRoute.name,
                        path: 'review',
                        parent: ProductDetailsWrapperRoute.name),
                    _i9.RouteConfig('*#redirect',
                        path: '*',
                        parent: ProductDetailsWrapperRoute.name,
                        redirectTo: '',
                        fullMatch: true)
                  ]),
              _i9.RouteConfig(PaymentMethodRoute.name,
                  path: 'payment_method', parent: DashboardWrapperRoute.name),
              _i9.RouteConfig(ShippingAddressesWrapperRoute.name,
                  path: 'shipping_address',
                  parent: DashboardWrapperRoute.name,
                  children: [
                    _i9.RouteConfig(ShippingAddressesRoute.name,
                        path: '', parent: ShippingAddressesWrapperRoute.name),
                    _i9.RouteConfig(AddShippingAddressRoute.name,
                        path: 'add_shipping_address',
                        parent: ShippingAddressesWrapperRoute.name)
                  ]),
              _i9.RouteConfig('*#redirect',
                  path: '*',
                  parent: DashboardWrapperRoute.name,
                  redirectTo: '',
                  fullMatch: true)
            ]),
        _i9.RouteConfig(SignRouter.name, path: '/sign', children: [
          _i9.RouteConfig('#redirect',
              path: '',
              parent: SignRouter.name,
              redirectTo: 'register',
              fullMatch: true),
          _i9.RouteConfig(LoginRoute.name,
              path: 'login', parent: SignRouter.name),
          _i9.RouteConfig(SignUpRoute.name,
              path: 'register', parent: SignRouter.name),
          _i9.RouteConfig('*#redirect',
              path: '*',
              parent: SignRouter.name,
              redirectTo: '',
              fullMatch: true)
        ]),
        _i9.RouteConfig(LoadingRoute.name, path: ''),
        _i9.RouteConfig('*#redirect',
            path: '*', redirectTo: '', fullMatch: true)
      ];
}

/// generated route for
/// [_i1.DashboardWrapperPage]
class DashboardWrapperRoute extends _i9.PageRouteInfo<void> {
  const DashboardWrapperRoute({List<_i9.PageRouteInfo>? children})
      : super(DashboardWrapperRoute.name,
            path: '/dashboard', initialChildren: children);

  static const String name = 'DashboardWrapperRoute';
}

/// generated route for
/// [_i2.SignWrapperPage]
class SignRouter extends _i9.PageRouteInfo<void> {
  const SignRouter({List<_i9.PageRouteInfo>? children})
      : super(SignRouter.name, path: '/sign', initialChildren: children);

  static const String name = 'SignRouter';
}

/// generated route for
/// [_i3.LoadingPage]
class LoadingRoute extends _i9.PageRouteInfo<void> {
  const LoadingRoute() : super(LoadingRoute.name, path: '');

  static const String name = 'LoadingRoute';
}

/// generated route for
/// [_i4.DashboardPage]
class DashboardRoute extends _i9.PageRouteInfo<void> {
  const DashboardRoute({List<_i9.PageRouteInfo>? children})
      : super(DashboardRoute.name, path: '', initialChildren: children);

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i5.ProductDetailsWrapperPage]
class ProductDetailsWrapperRoute
    extends _i9.PageRouteInfo<ProductDetailsWrapperRouteArgs> {
  ProductDetailsWrapperRoute(
      {required String id,
      _i28.XProduct? data,
      _i27.Key? key,
      List<_i9.PageRouteInfo>? children})
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

  final _i28.XProduct? data;

  final _i27.Key? key;

  @override
  String toString() {
    return 'ProductDetailsWrapperRouteArgs{id: $id, data: $data, key: $key}';
  }
}

/// generated route for
/// [_i6.PaymentMethodPage]
class PaymentMethodRoute extends _i9.PageRouteInfo<void> {
  const PaymentMethodRoute()
      : super(PaymentMethodRoute.name, path: 'payment_method');

  static const String name = 'PaymentMethodRoute';
}

/// generated route for
/// [_i7.ShippingAddressWrapperPage]
class ShippingAddressesWrapperRoute extends _i9.PageRouteInfo<void> {
  const ShippingAddressesWrapperRoute({List<_i9.PageRouteInfo>? children})
      : super(ShippingAddressesWrapperRoute.name,
            path: 'shipping_address', initialChildren: children);

  static const String name = 'ShippingAddressesWrapperRoute';
}

/// generated route for
/// [_i8.HomeWrapperPage]
class HomeTab extends _i9.PageRouteInfo<void> {
  const HomeTab({List<_i9.PageRouteInfo>? children})
      : super(HomeTab.name, path: 'home', initialChildren: children);

  static const String name = 'HomeTab';
}

/// generated route for
/// [_i9.EmptyRouterPage]
class ShopTab extends _i9.PageRouteInfo<void> {
  const ShopTab({List<_i9.PageRouteInfo>? children})
      : super(ShopTab.name, path: 'shop', initialChildren: children);

  static const String name = 'ShopTab';
}

/// generated route for
/// [_i9.EmptyRouterPage]
class CartTab extends _i9.PageRouteInfo<void> {
  const CartTab({List<_i9.PageRouteInfo>? children})
      : super(CartTab.name, path: 'cart', initialChildren: children);

  static const String name = 'CartTab';
}

/// generated route for
/// [_i9.EmptyRouterPage]
class FavoritesTab extends _i9.PageRouteInfo<void> {
  const FavoritesTab({List<_i9.PageRouteInfo>? children})
      : super(FavoritesTab.name, path: 'favorites', initialChildren: children);

  static const String name = 'FavoritesTab';
}

/// generated route for
/// [_i9.EmptyRouterPage]
class ProfileTab extends _i9.PageRouteInfo<void> {
  const ProfileTab({List<_i9.PageRouteInfo>? children})
      : super(ProfileTab.name, path: 'profile', initialChildren: children);

  static const String name = 'ProfileTab';
}

/// generated route for
/// [_i10.HomePage]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i11.ViewAllProductsPage]
class ViewAllRoute extends _i9.PageRouteInfo<ViewAllRouteArgs> {
  ViewAllRoute({_i27.Key? key, required _i29.ProductType productType})
      : super(ViewAllRoute.name,
            path: 'view_all',
            args: ViewAllRouteArgs(key: key, productType: productType));

  static const String name = 'ViewAllRoute';
}

class ViewAllRouteArgs {
  const ViewAllRouteArgs({this.key, required this.productType});

  final _i27.Key? key;

  final _i29.ProductType productType;

  @override
  String toString() {
    return 'ViewAllRouteArgs{key: $key, productType: $productType}';
  }
}

/// generated route for
/// [_i12.ShopPage]
class ShopRoute extends _i9.PageRouteInfo<void> {
  const ShopRoute() : super(ShopRoute.name, path: '');

  static const String name = 'ShopRoute';
}

/// generated route for
/// [_i13.DetailCategoryPage]
class DetailCategoryRoute extends _i9.PageRouteInfo<DetailCategoryRouteArgs> {
  DetailCategoryRoute(
      {_i27.Key? key, required String idCategory, required String nameCategory})
      : super(DetailCategoryRoute.name,
            path: 'product_by_category',
            args: DetailCategoryRouteArgs(
                key: key, idCategory: idCategory, nameCategory: nameCategory));

  static const String name = 'DetailCategoryRoute';
}

class DetailCategoryRouteArgs {
  const DetailCategoryRouteArgs(
      {this.key, required this.idCategory, required this.nameCategory});

  final _i27.Key? key;

  final String idCategory;

  final String nameCategory;

  @override
  String toString() {
    return 'DetailCategoryRouteArgs{key: $key, idCategory: $idCategory, nameCategory: $nameCategory}';
  }
}

/// generated route for
/// [_i14.SearchProductsByCategoryPage]
class SearchProductsByCategoryRoute extends _i9.PageRouteInfo<void> {
  const SearchProductsByCategoryRoute()
      : super(SearchProductsByCategoryRoute.name,
            path: 'search_products_by_category');

  static const String name = 'SearchProductsByCategoryRoute';
}

/// generated route for
/// [_i15.CartPage]
class CartRoute extends _i9.PageRouteInfo<void> {
  const CartRoute() : super(CartRoute.name, path: '');

  static const String name = 'CartRoute';
}

/// generated route for
/// [_i16.CheckoutPage]
class CheckoutRoute extends _i9.PageRouteInfo<void> {
  const CheckoutRoute() : super(CheckoutRoute.name, path: 'checkout');

  static const String name = 'CheckoutRoute';
}

/// generated route for
/// [_i17.FavoritesPage]
class FavoritesRoute extends _i9.PageRouteInfo<void> {
  const FavoritesRoute() : super(FavoritesRoute.name, path: '');

  static const String name = 'FavoritesRoute';
}

/// generated route for
/// [_i18.SearchFavoritePage]
class SearchFavoriteRoute extends _i9.PageRouteInfo<void> {
  const SearchFavoriteRoute()
      : super(SearchFavoriteRoute.name, path: 'search_products_by_favorite');

  static const String name = 'SearchFavoriteRoute';
}

/// generated route for
/// [_i19.ProfilePage]
class ProfileRoute extends _i9.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: '');

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i20.SettingPage]
class SettingRoute extends _i9.PageRouteInfo<void> {
  const SettingRoute() : super(SettingRoute.name, path: 'setting');

  static const String name = 'SettingRoute';
}

/// generated route for
/// [_i21.ProductDetailsPage]
class ProductDetailsRoute extends _i9.PageRouteInfo<void> {
  const ProductDetailsRoute() : super(ProductDetailsRoute.name, path: '');

  static const String name = 'ProductDetailsRoute';
}

/// generated route for
/// [_i22.ReviewPage]
class ReviewRoute extends _i9.PageRouteInfo<ReviewRouteArgs> {
  ReviewRoute({_i27.Key? key, required _i28.XProduct data})
      : super(ReviewRoute.name,
            path: 'review', args: ReviewRouteArgs(key: key, data: data));

  static const String name = 'ReviewRoute';
}

class ReviewRouteArgs {
  const ReviewRouteArgs({this.key, required this.data});

  final _i27.Key? key;

  final _i28.XProduct data;

  @override
  String toString() {
    return 'ReviewRouteArgs{key: $key, data: $data}';
  }
}

/// generated route for
/// [_i23.ShippingAddressesPage]
class ShippingAddressesRoute extends _i9.PageRouteInfo<void> {
  const ShippingAddressesRoute() : super(ShippingAddressesRoute.name, path: '');

  static const String name = 'ShippingAddressesRoute';
}

/// generated route for
/// [_i24.AddShippingAddressPage]
class AddShippingAddressRoute extends _i9.PageRouteInfo<void> {
  const AddShippingAddressRoute()
      : super(AddShippingAddressRoute.name, path: 'add_shipping_address');

  static const String name = 'AddShippingAddressRoute';
}

/// generated route for
/// [_i25.LoginPage]
class LoginRoute extends _i9.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: 'login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i26.SignUpPage]
class SignUpRoute extends _i9.PageRouteInfo<void> {
  const SignUpRoute() : super(SignUpRoute.name, path: 'register');

  static const String name = 'SignUpRoute';
}
