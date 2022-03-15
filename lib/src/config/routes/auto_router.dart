import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/src/config/routes/page_routers.dart';
import 'package:e_commerce/src/modules/auth/login/router/sign_router.dart';
import 'package:e_commerce/src/modules/dashboard/router/dashboard_router.dart';
import 'package:e_commerce/src/modules/loading/pages/loading_page.dart';
import 'package:e_commerce/src/modules/product_details/pages/product_details_page.dart';
import 'package:e_commerce/src/modules/rating/pages/rating_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    DashboardCoordinator.autoRoute,
    SignCoordinator.autoRoute,
    AutoRoute(
      path: XRoutes.loading,
      page: LoadingPage,
      initial: true,
    ),
    AutoRoute(
        name: "Detail",
        page: EmptyRouterPage,
        path: XRoutes.detailProduct,
        children: [
          AutoRoute(
              path: "", page: ProductDetailsPage, name: "ProductDetailsRoute"),
          AutoRoute(path: 'rating', page: RatingPage, name: "RatingRoute"),
          RedirectRoute(path: '*', redirectTo: ''),
        ]),

    // redirect all other paths
    RedirectRoute(path: '*', redirectTo: ''),
  ],
)
class $XRouter {}
