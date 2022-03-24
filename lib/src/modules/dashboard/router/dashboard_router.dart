import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/src/config/routes/auto_router.gr.dart';
import 'package:e_commerce/src/config/routes/page_routers.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/modules/cart/router/cart_router.dart';
import 'package:e_commerce/src/modules/dashboard/pages/dashboard_page.dart';
import 'package:e_commerce/src/modules/dashboard/router/dashboard_wrapper_router.dart';
import 'package:e_commerce/src/modules/favorites/router/favorites_router.dart';
import 'package:e_commerce/src/modules/home/router/home_router.dart';
import 'package:e_commerce/src/modules/payment_method/router/payment_method_router.dart';
import 'package:e_commerce/src/modules/product_details/router/product_details_router.dart';
import 'package:e_commerce/src/modules/profile/router/profile_router.dart';
import 'package:e_commerce/src/modules/shop/router/shop_router.dart';
import 'package:flutter/material.dart';

class DashboardRouters {
  static const String homeTab = 'home';
  static const String shopTab = 'shop';
  static const String cartTab = 'cart';
  static const String favoritesTab = 'favorites';
  static const String profileTab = 'profile';
}

class DashboardCoordinator {
  static const autoRoute = AutoRoute(
    path: XRoutes.dashboard,
    name: "DashboardWrapperRoute",
    page: DashboardWrapperPage,
    children: [
      AutoRoute(
          name: "DashboardRoute",
          page: DashboardPage,
          initial: true,
          children: [
            HomeCoordinator.autoRoute,
            ShopCoordinator.autoRoute,
            CartCoordinator.autoRoute,
            FavoritesCoordinator.autoRoute,
            ProfileCoordinator.autoRoute,
            RedirectRoute(path: '*', redirectTo: ''),
          ]),
      ProductDetailsCoordinator.autoRoute,
      PaymentMethodCoordinator.autoRoute,
      RedirectRoute(path: '*', redirectTo: ''),
    ],
  );

  static showYourCart(BuildContext context) =>
      context.router.navigate(const DashboardRoute(children: [CartTab()]));

  static showDetailsProduct(BuildContext context, {required XProduct data}) =>
      context.router.push(ProductDetailsWrapperRoute(
          data: data,
          children: [ProductDetailsRoute(id: data.id, data: data)]));

  static showPaymentMethod(BuildContext context) =>
      context.router.push(const PaymentMethodRoute());
}
