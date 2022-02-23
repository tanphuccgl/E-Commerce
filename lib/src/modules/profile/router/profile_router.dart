import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/src/modules/profile/router/profile_wrapper_router.dart';
import 'package:e_commerce/src/modules/settings/pages/setting_page.dart';
import 'package:e_commerce/src/modules/settings/router/setting_router.dart';
import 'package:flutter/cupertino.dart';

class ProfileRouters {
  static const String profile = 'profile';
}

class ProfileCoordinator {
  static const autoRoute = AutoRoute(
    path: "profile",
    name: "ProfileWrapperRoute",
    page: ProfileWrapperPage,
    children: [
      SettingCoordinator.autoRoute,
      RedirectRoute(path: '*', redirectTo: ''),
    ],
  );

  static showSettings(BuildContext context) {
    context.router.pushWidget(const SettingPage());
  }
}
