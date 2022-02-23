import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/src/config/routes/coordinator.dart';
import 'package:e_commerce/src/modules/settings/pages/setting_page.dart';
import 'package:e_commerce/src/modules/settings/router/setting_wrapper_router.dart';

class SettingRouters {
  static const String setting = 'setting';
}

class SettingCoordinator {
  static get router => XCoordinator.context;

  static const autoRoute = AutoRoute(
    path: SettingRouters.setting,
    name: "SettingWrapperRoute",
    page: SettingWrapperPage,
    children: [
      AutoRoute(page: SettingPage, path: "", initial: true),
      RedirectRoute(path: '*', redirectTo: ''),
    ],
  );
}
