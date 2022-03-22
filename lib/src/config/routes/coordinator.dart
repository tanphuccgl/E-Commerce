import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/src/config/routes/auto_router.gr.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class XCoordinator {
  static XRouter get rootRouter => GetIt.I<XRouter>();

  static BuildContext get context =>
      rootRouter.navigatorKey.currentState!.context;
  static pop(BuildContext context) {
    context.router.pop();
  }

  static showDashboard() {
    rootRouter.replace(const DashboardWrapperRoute());
  }

  static showDetailProduct(BuildContext context, {required XProduct data}) {
    context.router.push(ProductDetailsWrapperRoute(data: data, children: [
      ProductDetailsRouter(
          children: [ProductDetailsRoute(id: data.id, data: data)])
    ]));
  }

  static showRatings(BuildContext context, {required XProduct data}) {
    context.router.push(ReviewRoute(
      data: data,
    ));
  }

  static showPaymentMethod(BuildContext context) {
    context.router.push(const PaymentMethodRoute());
  }
}
