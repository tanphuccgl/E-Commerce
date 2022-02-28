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
import 'package:flutter/material.dart' as _i15;

import '../../modules/auth/login/pages/login_page.dart' as _i13;
import '../../modules/auth/login/router/sign_wrapper_router.dart' as _i2;
import '../../modules/auth/sign_up/pages/sign_up_page.dart' as _i14;
import '../../modules/bag/pages/bag_page.dart' as _i7;
import '../../modules/dashboard/pages/dashboard_page.dart' as _i4;
import '../../modules/dashboard/router/dashboard_wrapper_router.dart' as _i1;
import '../../modules/favorites/pages/favorites_page.dart' as _i8;
import '../../modules/home/pages/home_page.dart' as _i5;
import '../../modules/loading/pages/loading_page.dart' as _i3;
import '../../modules/profile/pages/profile_page.dart' as _i11;
import '../../modules/settings/pages/setting_page.dart' as _i12;
import '../../modules/shop/pages/shop_page.dart' as _i9;
import '../../modules/tops/pages/tops_page.dart' as _i10;

class XRouter extends _i6.RootStackRouter {
  XRouter([_i15.GlobalKey<_i15.NavigatorState>? navigatorKey])
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
    FavoritesRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.FavoritesPage());
    },
    ProfileTab.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.EmptyRouterPage());
    },
    ShopRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.ShopPage());
    },
    TopsRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.TopsPage());
    },
    ProfileRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.ProfilePage());
    },
    SettingRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.SettingPage());
    },
    LoginRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.LoginPage());
    },
    SignUpRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i14.SignUpPage());
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
                          _i6.RouteConfig(TopsRoute.name,
                              path: 'tops', parent: ShopTab.name),
                          _i6.RouteConfig('*#redirect',
                              path: '*',
                              parent: ShopTab.name,
                              redirectTo: '',
                              fullMatch: true)
                        ]),
                    _i6.RouteConfig(BagRoute.name,
                        path: 'bag', parent: DashboardRoute.name),
                    _i6.RouteConfig(FavoritesRoute.name,
                        path: 'favorites', parent: DashboardRoute.name),
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
/// [_i8.FavoritesPage]
class FavoritesRoute extends _i6.PageRouteInfo<void> {
  const FavoritesRoute() : super(FavoritesRoute.name, path: 'favorites');

  static const String name = 'FavoritesRoute';
}

/// generated route for
/// [_i6.EmptyRouterPage]
class ProfileTab extends _i6.PageRouteInfo<void> {
  const ProfileTab({List<_i6.PageRouteInfo>? children})
      : super(ProfileTab.name, path: 'profile', initialChildren: children);

  static const String name = 'ProfileTab';
}

/// generated route for
/// [_i9.ShopPage]
class ShopRoute extends _i6.PageRouteInfo<void> {
  const ShopRoute() : super(ShopRoute.name, path: '');

  static const String name = 'ShopRoute';
}

/// generated route for
/// [_i10.TopsPage]
class TopsRoute extends _i6.PageRouteInfo<void> {
  const TopsRoute() : super(TopsRoute.name, path: 'tops');

  static const String name = 'TopsRoute';
}

/// generated route for
/// [_i11.ProfilePage]
class ProfileRoute extends _i6.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: '');

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i12.SettingPage]
class SettingRoute extends _i6.PageRouteInfo<void> {
  const SettingRoute() : super(SettingRoute.name, path: 'setting');

  static const String name = 'SettingRoute';
}

/// generated route for
/// [_i13.LoginPage]
class LoginRoute extends _i6.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: 'login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i14.SignUpPage]
class SignUpRoute extends _i6.PageRouteInfo<void> {
  const SignUpRoute() : super(SignUpRoute.name, path: 'register');

  static const String name = 'SignUpRoute';
}
