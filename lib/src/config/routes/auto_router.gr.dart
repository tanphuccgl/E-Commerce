// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;

import '../../modules/auth/login/pages/login_page.dart' as _i6;
import '../../modules/auth/login/router/sign_wrapper_router.dart' as _i2;
import '../../modules/auth/register/pages/register_page.dart' as _i7;
import '../../modules/dashboard/pages/aa.dart' as _i5;
import '../../modules/dashboard/pages/dashboard_page.dart' as _i4;
import '../../modules/dashboard/router/dashboard_wrapper_router.dart' as _i1;
import '../../modules/loading/pages/loading_page.dart' as _i3;

class XRouter extends _i8.RootStackRouter {
  XRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    HomeWrapperRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomeWrapperPage());
    },
    SignRouter.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.SignWrapperPage());
    },
    LoadingRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.LoadingPage());
    },
    DashboardRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.DashboardPage());
    },
    ARoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.APage());
    },
    LoginRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.LoginPage());
    },
    RegisterRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.RegisterPage());
    }
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig('/#redirect',
            path: '/', redirectTo: '/dashboard', fullMatch: true),
        _i8.RouteConfig(HomeWrapperRoute.name, path: '/dashboard', children: [
          _i8.RouteConfig(DashboardRoute.name,
              path: 'dashboard', parent: HomeWrapperRoute.name),
          _i8.RouteConfig(ARoute.name,
              path: 'a', parent: HomeWrapperRoute.name),
          _i8.RouteConfig('*#redirect',
              path: '*',
              parent: HomeWrapperRoute.name,
              redirectTo: '',
              fullMatch: true)
        ]),
        _i8.RouteConfig(SignRouter.name, path: '/sign', children: [
          _i8.RouteConfig('#redirect',
              path: '',
              parent: SignRouter.name,
              redirectTo: 'login',
              fullMatch: true),
          _i8.RouteConfig(LoginRoute.name,
              path: 'login', parent: SignRouter.name),
          _i8.RouteConfig(RegisterRoute.name,
              path: 'register', parent: SignRouter.name),
          _i8.RouteConfig('*#redirect',
              path: '*',
              parent: SignRouter.name,
              redirectTo: '',
              fullMatch: true)
        ]),
        _i8.RouteConfig(LoadingRoute.name, path: ''),
        _i8.RouteConfig('*#redirect',
            path: '*', redirectTo: '', fullMatch: true)
      ];
}

/// generated route for
/// [_i1.HomeWrapperPage]
class HomeWrapperRoute extends _i8.PageRouteInfo<void> {
  const HomeWrapperRoute({List<_i8.PageRouteInfo>? children})
      : super(HomeWrapperRoute.name,
            path: '/dashboard', initialChildren: children);

  static const String name = 'HomeWrapperRoute';
}

/// generated route for
/// [_i2.SignWrapperPage]
class SignRouter extends _i8.PageRouteInfo<void> {
  const SignRouter({List<_i8.PageRouteInfo>? children})
      : super(SignRouter.name, path: '/sign', initialChildren: children);

  static const String name = 'SignRouter';
}

/// generated route for
/// [_i3.LoadingPage]
class LoadingRoute extends _i8.PageRouteInfo<void> {
  const LoadingRoute() : super(LoadingRoute.name, path: '');

  static const String name = 'LoadingRoute';
}

/// generated route for
/// [_i4.DashboardPage]
class DashboardRoute extends _i8.PageRouteInfo<void> {
  const DashboardRoute() : super(DashboardRoute.name, path: 'dashboard');

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i5.APage]
class ARoute extends _i8.PageRouteInfo<void> {
  const ARoute() : super(ARoute.name, path: 'a');

  static const String name = 'ARoute';
}

/// generated route for
/// [_i6.LoginPage]
class LoginRoute extends _i8.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: 'login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i7.RegisterPage]
class RegisterRoute extends _i8.PageRouteInfo<void> {
  const RegisterRoute() : super(RegisterRoute.name, path: 'register');

  static const String name = 'RegisterRoute';
}
