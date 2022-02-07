import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/src/config/routes/page_routers.dart';
import 'package:e_commerce/src/modules/auth/login/pages/login_page.dart';
import 'package:e_commerce/src/modules/auth/register/pages/register_page.dart';
import 'package:e_commerce/src/modules/dashboard/pages/dashboard_page.dart';
import 'package:e_commerce/src/modules/loading/pages/loading_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
        path: XRouteNames.dashboard,
        page: DashboardPage,
       ),
    // AutoRoute(
    //   path: XRouteNames.loading,
    //   page: LoadingPage,
    // ),

    AutoRoute(
      initial: true,
      page: LoadingPage,
      children: [
        AutoRoute(path: "", page: LoginPage),
        AutoRoute(
          path: XRouteNames.register,
          page: RegisterPage,
        ),
        RedirectRoute(path: '*', redirectTo: ''),
      ],
    ),

    // redirect all other paths
    RedirectRoute(path: '*', redirectTo: ''),
  ],
)
class $XRouter {}
