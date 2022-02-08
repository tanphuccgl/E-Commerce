import 'package:auto_route/auto_route.dart';

import 'package:e_commerce/src/modules/loading/pages/loading_page.dart';

class LoadingRouters {
  static const String loading = '';
}

class LoadingCoordinator {
  static const autoRoute = AutoRoute(
    path: LoadingRouters.loading,
    page: LoadingPage,
    initial: true,
  );
}
