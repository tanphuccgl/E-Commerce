import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/src/config/routes/page_routers.dart';
import 'package:e_commerce/src/modules/dashboard/pages/aa.dart';
import 'package:e_commerce/src/modules/dashboard/pages/dashboard_page.dart';
import 'package:e_commerce/src/modules/dashboard/router/dashboard_wrapper_router.dart';
import 'package:flutter/cupertino.dart';

class HomeRouters {
  static const String dashboard = 'dashboard';
  static const String a = 'a';
}

class HomeCoordinator {
  static const autoRoute = AutoRoute(
    path: XRoutes.dashboard,
    name: "HomeWrapperRoute",
    page: HomeWrapperPage, initial: true,
    children: [
      AutoRoute(
          path: HomeRouters.dashboard, page: DashboardPage,),
      AutoRoute(path: HomeRouters.a, page: APage),
      RedirectRoute(path: '*', redirectTo: ''),
    ],
  );
  static showA(BuildContext context) {
    context.router.pushNamed(HomeRouters.a);
  }

  static showDashboard(BuildContext context) {
    context.router.pushNamed(HomeRouters.dashboard);
  }
}
