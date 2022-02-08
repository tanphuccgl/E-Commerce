import 'package:auto_route/auto_route.dart';

import 'package:e_commerce/src/modules/dashboard/pages/dashboard_page.dart';

import '../../../config/routes/page_routers.dart';

class DashboardCoordinator {
  static const autoRoute =
      AutoRoute(path: XRoutes.dashboard, page: DashboardPage);
}
