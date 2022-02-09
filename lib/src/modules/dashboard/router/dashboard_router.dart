import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/src/config/routes/auto_router.gr.dart';
import 'package:e_commerce/src/config/routes/page_routers.dart';
import 'package:e_commerce/src/modules/bag/pages/bag_page.dart';
import 'package:e_commerce/src/modules/dashboard/pages/dashboard_page.dart';
import 'package:e_commerce/src/modules/dashboard/router/dashboard_wrapper_router.dart';
import 'package:e_commerce/src/modules/favorites/pages/favorites_page.dart';
import 'package:e_commerce/src/modules/home/pages/home_page.dart';
import 'package:e_commerce/src/modules/profile/pages/profile_page.dart';
import 'package:e_commerce/src/modules/shop/pages/shop_page.dart';
import 'package:flutter/cupertino.dart';

class DashboardRouters {
  static const String dashboard = '';
  static const String home = 'home';
  static const String shop = 'shop';
  static const String bag = 'bag';
  static const String favorites = 'favorites';
  static const String profile = 'profile';
}

class DashboardCoordinator {
  static const autoRoute = AutoRoute(
    path: XRoutes.dashboard,
    name: "DashboardWrapperRoute",
    page: DashboardWrapperPage,
    //initial: true,
    children: [
      AutoRoute(
        path: DashboardRouters.dashboard,
        page: DashboardPage,
      ),
      AutoRoute(
        path: DashboardRouters.home,
        page: HomePage,
      ),
      AutoRoute(path: DashboardRouters.shop, page: ShopPage),
      AutoRoute(path: DashboardRouters.bag, page: BagPage),
      AutoRoute(path: DashboardRouters.favorites, page: FavoritesPage),
      AutoRoute(path: DashboardRouters.profile, page: ProfilePage),
      RedirectRoute(path: '*', redirectTo: ''),
    ],
  );
  static showDashboard(BuildContext context) {
    context.router.replace(const DashboardWrapperRoute());
  }

  static showShop(BuildContext context) {
    context.router.pushNamed(DashboardRouters.shop);
  }

  static showBag(BuildContext context) {
    context.router.pushNamed(DashboardRouters.bag);
  }

  static showFavorites(BuildContext context) {
    context.router.pushNamed(DashboardRouters.favorites);
  }

  static showProfile(BuildContext context) {
    context.router.pushNamed(DashboardRouters.profile);
  }

  // static showHome(BuildContext context) {
  //   context.router.pushNamed(DashboardRouters.home);
  // }
}
