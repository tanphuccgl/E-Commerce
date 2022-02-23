// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i15;
import 'package:flutter/material.dart' as _i16;

import '../../modules/auth/login/pages/login_page.dart' as _i13;
import '../../modules/auth/login/router/sign_wrapper_router.dart' as _i3;
import '../../modules/auth/sign_up/pages/sign_up_page.dart' as _i14;
import '../../modules/bag/pages/bag_page.dart' as _i8;
import '../../modules/dashboard/pages/dashboard_page.dart' as _i5;
import '../../modules/dashboard/router/dashboard_wrapper_router.dart' as _i1;
import '../../modules/favorites/pages/favorites_page.dart' as _i9;
import '../../modules/home/pages/home_page.dart' as _i6;
import '../../modules/loading/pages/loading_page.dart' as _i4;
import '../../modules/profile/pages/profile_page.dart' as _i10;
import '../../modules/profile/router/profile_wrapper_router.dart' as _i2;
import '../../modules/settings/pages/setting_page.dart' as _i12;
import '../../modules/settings/router/setting_wrapper_router.dart' as _i11;
import '../../modules/shop/pages/shop_page.dart' as _i7;

class XRouter extends _i15.RootStackRouter {
  XRouter([_i16.GlobalKey<_i16.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i15.PageFactory> pagesMap = {
    DashboardWrapperRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.DashboardWrapperPage());
    },
    ProfileWrapperRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.ProfileWrapperPage());
    },
    SignRouter.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.SignWrapperPage());
    },
    LoadingRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.LoadingPage());
    },
    DashboardRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.DashboardPage());
    },
    HomeRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.HomePage());
    },
    ShopRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.ShopPage());
    },
    BagRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.BagPage());
    },
    FavoritesRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.FavoritesPage());
    },
    ProfileRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.ProfilePage());
    },
    SettingWrapperRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.SettingWrapperPage());
    },
    SettingRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.SettingPage());
    },
    LoginRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.LoginPage());
    },
    SignUpRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i14.SignUpPage());
    }
  };

  @override
  List<_i15.RouteConfig> get routes => [
        _i15.RouteConfig('/#redirect',
            path: '/', redirectTo: '', fullMatch: true),
        _i15.RouteConfig(DashboardWrapperRoute.name,
            path: '/dashboard',
            children: [
              _i15.RouteConfig(DashboardRoute.name,
                  path: '', parent: DashboardWrapperRoute.name),
              _i15.RouteConfig(HomeRoute.name,
                  path: 'home', parent: DashboardWrapperRoute.name),
              _i15.RouteConfig(ShopRoute.name,
                  path: 'shop', parent: DashboardWrapperRoute.name),
              _i15.RouteConfig(BagRoute.name,
                  path: 'bag', parent: DashboardWrapperRoute.name),
              _i15.RouteConfig(FavoritesRoute.name,
                  path: 'favorites', parent: DashboardWrapperRoute.name),
              _i15.RouteConfig(ProfileRoute.name,
                  path: 'profile', parent: DashboardWrapperRoute.name),
              _i15.RouteConfig('*#redirect',
                  path: '*',
                  parent: DashboardWrapperRoute.name,
                  redirectTo: '',
                  fullMatch: true)
            ]),
        _i15.RouteConfig(ProfileWrapperRoute.name, path: 'profile', children: [
          _i15.RouteConfig(SettingWrapperRoute.name,
              path: 'haha',
              parent: ProfileWrapperRoute.name,
              children: [
                _i15.RouteConfig('#redirect',
                    path: '',
                    parent: SettingWrapperRoute.name,
                    redirectTo: 'setting',
                    fullMatch: true),
                _i15.RouteConfig(SettingRoute.name,
                    path: 'setting', parent: SettingWrapperRoute.name),
                _i15.RouteConfig('*#redirect',
                    path: '*',
                    parent: SettingWrapperRoute.name,
                    redirectTo: '',
                    fullMatch: true)
              ]),
          _i15.RouteConfig('*#redirect',
              path: '*',
              parent: ProfileWrapperRoute.name,
              redirectTo: '',
              fullMatch: true)
        ]),
        _i15.RouteConfig(SignRouter.name, path: '/sign', children: [
          _i15.RouteConfig('#redirect',
              path: '',
              parent: SignRouter.name,
              redirectTo: 'register',
              fullMatch: true),
          _i15.RouteConfig(LoginRoute.name,
              path: 'login', parent: SignRouter.name),
          _i15.RouteConfig(SignUpRoute.name,
              path: 'register', parent: SignRouter.name),
          _i15.RouteConfig('*#redirect',
              path: '*',
              parent: SignRouter.name,
              redirectTo: '',
              fullMatch: true)
        ]),
        _i15.RouteConfig(LoadingRoute.name, path: ''),
        _i15.RouteConfig('*#redirect',
            path: '*', redirectTo: '', fullMatch: true)
      ];
}

/// generated route for
/// [_i1.DashboardWrapperPage]
class DashboardWrapperRoute extends _i15.PageRouteInfo<void> {
  const DashboardWrapperRoute({List<_i15.PageRouteInfo>? children})
      : super(DashboardWrapperRoute.name,
            path: '/dashboard', initialChildren: children);

  static const String name = 'DashboardWrapperRoute';
}

/// generated route for
/// [_i2.ProfileWrapperPage]
class ProfileWrapperRoute extends _i15.PageRouteInfo<void> {
  const ProfileWrapperRoute({List<_i15.PageRouteInfo>? children})
      : super(ProfileWrapperRoute.name,
            path: 'profile', initialChildren: children);

  static const String name = 'ProfileWrapperRoute';
}

/// generated route for
/// [_i3.SignWrapperPage]
class SignRouter extends _i15.PageRouteInfo<void> {
  const SignRouter({List<_i15.PageRouteInfo>? children})
      : super(SignRouter.name, path: '/sign', initialChildren: children);

  static const String name = 'SignRouter';
}

/// generated route for
/// [_i4.LoadingPage]
class LoadingRoute extends _i15.PageRouteInfo<void> {
  const LoadingRoute() : super(LoadingRoute.name, path: '');

  static const String name = 'LoadingRoute';
}

/// generated route for
/// [_i5.DashboardPage]
class DashboardRoute extends _i15.PageRouteInfo<void> {
  const DashboardRoute() : super(DashboardRoute.name, path: '');

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i6.HomePage]
class HomeRoute extends _i15.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: 'home');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i7.ShopPage]
class ShopRoute extends _i15.PageRouteInfo<void> {
  const ShopRoute() : super(ShopRoute.name, path: 'shop');

  static const String name = 'ShopRoute';
}

/// generated route for
/// [_i8.BagPage]
class BagRoute extends _i15.PageRouteInfo<void> {
  const BagRoute() : super(BagRoute.name, path: 'bag');

  static const String name = 'BagRoute';
}

/// generated route for
/// [_i9.FavoritesPage]
class FavoritesRoute extends _i15.PageRouteInfo<void> {
  const FavoritesRoute() : super(FavoritesRoute.name, path: 'favorites');

  static const String name = 'FavoritesRoute';
}

/// generated route for
/// [_i10.ProfilePage]
class ProfileRoute extends _i15.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: 'profile');

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i11.SettingWrapperPage]
class SettingWrapperRoute extends _i15.PageRouteInfo<void> {
  const SettingWrapperRoute({List<_i15.PageRouteInfo>? children})
      : super(SettingWrapperRoute.name,
            path: 'haha', initialChildren: children);

  static const String name = 'SettingWrapperRoute';
}

/// generated route for
/// [_i12.SettingPage]
class SettingRoute extends _i15.PageRouteInfo<void> {
  const SettingRoute() : super(SettingRoute.name, path: 'setting');

  static const String name = 'SettingRoute';
}

/// generated route for
/// [_i13.LoginPage]
class LoginRoute extends _i15.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: 'login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i14.SignUpPage]
class SignUpRoute extends _i15.PageRouteInfo<void> {
  const SignUpRoute() : super(SignUpRoute.name, path: 'register');

  static const String name = 'SignUpRoute';
}
