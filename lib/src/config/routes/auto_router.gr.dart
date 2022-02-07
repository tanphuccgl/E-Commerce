// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../../modules/auth/login/pages/login_page.dart' as _i3;
import '../../modules/auth/register/pages/register_page.dart' as _i4;
import '../../modules/dashboard/pages/dashboard_page.dart' as _i1;
import '../../modules/loading/pages/loading_page.dart' as _i2;

class XRouter extends _i5.RootStackRouter {
  XRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    DashboardRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.DashboardPage());
    },
    LoadingRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.LoadingPage());
    },
    LoginRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.LoginPage());
    },
    RegisterRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.RegisterPage());
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(DashboardRoute.name, path: '/DashboardPage'),
        _i5.RouteConfig(LoadingRoute.name, path: '/', children: [
          _i5.RouteConfig(LoginRoute.name, path: '', parent: LoadingRoute.name),
          _i5.RouteConfig(RegisterRoute.name,
              path: 'RegisterPage', parent: LoadingRoute.name),
          _i5.RouteConfig('*#redirect',
              path: '*',
              parent: LoadingRoute.name,
              redirectTo: '',
              fullMatch: true)
        ]),
        _i5.RouteConfig('*#redirect',
            path: '*', redirectTo: '', fullMatch: true)
      ];
}

/// generated route for
/// [_i1.DashboardPage]
class DashboardRoute extends _i5.PageRouteInfo<void> {
  const DashboardRoute() : super(DashboardRoute.name, path: '/DashboardPage');

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i2.LoadingPage]
class LoadingRoute extends _i5.PageRouteInfo<void> {
  const LoadingRoute({List<_i5.PageRouteInfo>? children})
      : super(LoadingRoute.name, path: '/', initialChildren: children);

  static const String name = 'LoadingRoute';
}

/// generated route for
/// [_i3.LoginPage]
class LoginRoute extends _i5.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i4.RegisterPage]
class RegisterRoute extends _i5.PageRouteInfo<void> {
  const RegisterRoute() : super(RegisterRoute.name, path: 'RegisterPage');

  static const String name = 'RegisterRoute';
}
