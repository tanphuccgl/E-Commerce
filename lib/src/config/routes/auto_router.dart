import 'package:auto_route/auto_route.dart';

import '../../modules/auth/login/router/sign_router.dart';
import '../../modules/dashboard/router/dashboard_router.dart';
import '../../modules/loading/router/loading_router.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    // TODO: có 3 stack chính là: loading, dashboard, và sign. Em refactor lại đoạn này
    // Tham khảo: https://github.com/j1mmyto9/flutter-boilerplate/tree/main/lib/src/features/order/router

    SignCoordinator.autoRoute,
    LoadingCoordinator.autoRoute,
    DashboardCoordinator.autoRoute,

    // redirect all other paths
    RedirectRoute(path: '*', redirectTo: ''),
  ],
)
class $XRouter {}
