import 'package:e_commerce/src/config/routes/auto_router.gr.dart';
import 'package:e_commerce/src/config/routes/page_routers.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class XCoordinator {
  static XRouter get rootRouter => GetIt.I<XRouter>();

  static BuildContext get context =>
      rootRouter.navigatorKey.currentState!.context;
  static pop() {
    rootRouter.pop();
  }

  static showLoadingPage() {
    rootRouter.pushNamed(XRoutes.loading);
  }

  static showDashboardPage() {
    rootRouter.pushNamed(XRoutes.dashboard);
  }

  static logout() {
    rootRouter.removeUntil((route) => false);
    rootRouter.pushNamed(XRoutes.sign);
  }
}
