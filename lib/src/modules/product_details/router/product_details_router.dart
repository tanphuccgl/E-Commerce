import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/src/config/routes/auto_router.gr.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/modules/dashboard/router/dashboard_router.dart';
import 'package:e_commerce/src/modules/product_details/pages/product_details_page.dart';
import 'package:e_commerce/src/modules/product_details/router/product_details_wrapper_router.dart';
import 'package:e_commerce/src/modules/review/pages/review_page.dart';
import 'package:flutter/material.dart';

class ProductDetailsRouters {
  static const String review = 'review';
}

class ProductDetailsCoordinator {
  static const autoRoute = AutoRoute(
      name: "ProductDetailsWrapperRoute",
      page: ProductDetailsWrapperPage,
      path: DashboardRouters.productDetail,
      // path: ProductDetailsRouters.detailsProduct,
      children: [
        AutoRoute(
            path: '', page: ProductDetailsPage, name: 'ProductDetailsRoute'),
        AutoRoute(
          path: ProductDetailsRouters.review,
          page: ReviewPage,
          name: "ReviewRoute",
        ),
        RedirectRoute(path: '*', redirectTo: ''),
      ]);

  static showReviews(BuildContext context, {required XProduct data}) =>
      context.router.push(ReviewRoute(data: data));

  //TODO: push error
  static showRelatedProduct(BuildContext context, {required XProduct data}) =>
      context.router.push(ProductDetailsRoute(id: data.id, data: data));

  /// TODO: show write review
}
