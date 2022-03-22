import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/src/config/routes/page_routers.dart';
import 'package:e_commerce/src/modules/auth/login/router/sign_router.dart';
import 'package:e_commerce/src/modules/dashboard/router/dashboard_router.dart';
import 'package:e_commerce/src/modules/loading/pages/loading_page.dart';
import 'package:e_commerce/src/modules/payment_method/pages/payment_method_page.dart';
import 'package:e_commerce/src/modules/product_details/pages/product_details_page.dart';
import 'package:e_commerce/src/modules/product_details/pages/product_details_wrapper_router.dart';
import 'package:e_commerce/src/modules/review/pages/review_page.dart';

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
        name: "ProductDetailsWrapperRoute",
        page: ProductDetailsWrapperPage,
        path: 'details_product',
        children: [
          AutoRoute(
              path: '',
              page: EmptyRouterPage,
              name: "ProductDetailsRouter",
              children: [
                AutoRoute(
                    path: XRoutes.detailProduct,
                    page: ProductDetailsPage,
                    name: 'ProductDetailsRoute',
                    initial: true),
                AutoRoute(
                  path: 'review',
                  page: ReviewPage,
                  name: "ReviewRoute",
                ),
                RedirectRoute(path: '*', redirectTo: ''),
              ]),
          RedirectRoute(path: '*', redirectTo: ''),
        ]),
    AutoRoute(
        path: "payment_method",
        page: PaymentMethodPage,
        name: "PaymentMethodRoute"),

    // redirect all other paths
    RedirectRoute(path: '*', redirectTo: ''),
  ],
)
class $XRouter {}
