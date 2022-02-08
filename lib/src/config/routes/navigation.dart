import 'package:e_commerce/src/config/routes/page_routers.dart';

import 'coordinator.dart';

// TODO: Ko cần thiết. di chuyển các function này vào file coordinator.dart
class XNavigation {
  static get appRouter => XCoordinator.rootRouter;

  static pop() {
    appRouter.pop();
  }

  static showLoadingPage() {
    appRouter.pushNamed(XRouteNames.loading);
  }

  static showDashboardPage() {
    appRouter.push(XRouteNames.dashboard);
  }

  static logout() {
    appRouter.removeUntil((route) => false);
    appRouter.pushNamed(XRouteNames.login);
  }
}
