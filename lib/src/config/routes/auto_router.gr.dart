// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/material.dart' as _i13;

import '../../modules/auth/login/pages/login_page.dart' as _i10;
import '../../modules/auth/login/router/sign_wrapper_router.dart' as _i2;
import '../../modules/auth/register/pages/register_page.dart' as _i11;
import '../../modules/bag/pages/bag_page.dart' as _i7;
import '../../modules/dashboard/pages/dashboard_page.dart' as _i4;
import '../../modules/dashboard/router/dashboard_wrapper_router.dart' as _i1;
import '../../modules/favorites/pages/favorites_page.dart' as _i8;
import '../../modules/home/pages/home_page.dart' as _i5;
import '../../modules/loading/pages/loading_page.dart' as _i3;
import '../../modules/profile/pages/profile_page.dart' as _i9;
import '../../modules/shop/pages/shop_page.dart' as _i6;

class XRouter extends _i12.RootStackRouter {
  XRouter([_i13.GlobalKey<_i13.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    DashboardWrapperRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.DashboardWrapperPage());
    },
    SignRouter.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.SignWrapperPage());
    },
    LoadingRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.LoadingPage());
    },
    DashboardRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.DashboardPage());
    },
    HomeRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.HomePage());
    },
    ShopRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.ShopPage());
    },
    BagRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.BagPage());
    },
    FavoritesRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.FavoritesPage());
    },
    ProfileRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.ProfilePage());
    },
    LoginRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.LoginPage());
    },
    RegisterRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.RegisterPage());
    }
  };

  @override
  List<_i12.RouteConfig> get routes => [
        _i12.RouteConfig('/#redirect',
            path: '/', redirectTo: '', fullMatch: true),
        _i12.RouteConfig(DashboardWrapperRoute.name,
            path: '/dashboard',
            children: [
              _i12.RouteConfig(DashboardRoute.name,
                  path: '', parent: DashboardWrapperRoute.name),
              _i12.RouteConfig(HomeRoute.name,
                  path: 'home', parent: DashboardWrapperRoute.name),
              _i12.RouteConfig(ShopRoute.name,
                  path: 'shop', parent: DashboardWrapperRoute.name),
              _i12.RouteConfig(BagRoute.name,
                  path: 'bag', parent: DashboardWrapperRoute.name),
              _i12.RouteConfig(FavoritesRoute.name,
                  path: 'favorites', parent: DashboardWrapperRoute.name),
              _i12.RouteConfig(ProfileRoute.name,
                  path: 'profile', parent: DashboardWrapperRoute.name),
              _i12.RouteConfig('*#redirect',
                  path: '*',
                  parent: DashboardWrapperRoute.name,
                  redirectTo: '',
                  fullMatch: true)
            ]),
        _i12.RouteConfig(SignRouter.name, path: '/sign', children: [
          _i12.RouteConfig('#redirect',
              path: '',
              parent: SignRouter.name,
              redirectTo: 'login',
              fullMatch: true),
          _i12.RouteConfig(LoginRoute.name,
              path: 'login', parent: SignRouter.name),
          _i12.RouteConfig(RegisterRoute.name,
              path: 'register', parent: SignRouter.name),
          _i12.RouteConfig('*#redirect',
              path: '*',
              parent: SignRouter.name,
              redirectTo: '',
              fullMatch: true)
        ]),
        _i12.RouteConfig(LoadingRoute.name, path: ''),
        _i12.RouteConfig('*#redirect',
            path: '*', redirectTo: '', fullMatch: true)
      ];
}

/// generated route for
/// [_i1.DashboardWrapperPage]
class DashboardWrapperRoute extends _i12.PageRouteInfo<void> {
  const DashboardWrapperRoute({List<_i12.PageRouteInfo>? children})
      : super(DashboardWrapperRoute.name,
            path: '/dashboard', initialChildren: children);

  static const String name = 'DashboardWrapperRoute';
}

/// generated route for
/// [_i2.SignWrapperPage]
class SignRouter extends _i12.PageRouteInfo<void> {
  const SignRouter({List<_i12.PageRouteInfo>? children})
      : super(SignRouter.name, path: '/sign', initialChildren: children);

  static const String name = 'SignRouter';
}

/// generated route for
/// [_i3.LoadingPage]
class LoadingRoute extends _i12.PageRouteInfo<void> {
  const LoadingRoute() : super(LoadingRoute.name, path: '');

  static const String name = 'LoadingRoute';
}

/// generated route for
/// [_i4.DashboardPage]
class DashboardRoute extends _i12.PageRouteInfo<void> {
  const DashboardRoute() : super(DashboardRoute.name, path: '');

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i5.HomePage]
class HomeRoute extends _i12.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: 'home');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i6.ShopPage]
class ShopRoute extends _i12.PageRouteInfo<void> {
  const ShopRoute() : super(ShopRoute.name, path: 'shop');

  static const String name = 'ShopRoute';
}

/// generated route for
/// [_i7.BagPage]
class BagRoute extends _i12.PageRouteInfo<void> {
  const BagRoute() : super(BagRoute.name, path: 'bag');

  static const String name = 'BagRoute';
}

/// generated route for
/// [_i8.FavoritesPage]
class FavoritesRoute extends _i12.PageRouteInfo<void> {
  const FavoritesRoute() : super(FavoritesRoute.name, path: 'favorites');

  static const String name = 'FavoritesRoute';
}

/// generated route for
/// [_i9.ProfilePage]
class ProfileRoute extends _i12.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: 'profile');

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i10.LoginPage]
class LoginRoute extends _i12.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: 'login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i11.RegisterPage]
class RegisterRoute extends _i12.PageRouteInfo<void> {
  const RegisterRoute() : super(RegisterRoute.name, path: 'register');

  static const String name = 'RegisterRoute';
}
