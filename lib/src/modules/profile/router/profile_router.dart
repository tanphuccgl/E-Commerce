import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/src/config/routes/auto_router.gr.dart';
import 'package:e_commerce/src/modules/dashboard/router/dashboard_router.dart';
import 'package:e_commerce/src/modules/profile/pages/profile_page.dart';
import 'package:e_commerce/src/modules/settings/pages/setting_page.dart';
import 'package:flutter/material.dart';

class ProfileRouters {
  static const String setting = 'setting';
}

class ProfileCoordinator {
  static const autoRoute = AutoRoute(
      name: "ProfileTab",
      page: EmptyRouterPage,
      path: DashboardTaps.profileTab,
      children: [
        AutoRoute(path: "", page: ProfilePage, name: "ProfileRoute"),
        AutoRoute(
            path: ProfileRouters.setting,
            page: SettingPage,
            name: "SettingRoute"),
        RedirectRoute(path: '*', redirectTo: ''),
      ]);

  static showSetting(BuildContext context) =>
      context.router.push(const SettingRoute());
}
