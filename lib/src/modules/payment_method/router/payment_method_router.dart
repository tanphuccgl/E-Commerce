import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/src/modules/payment_method/pages/payment_method_page.dart';

class PaymentMethodRouters {
  static const String paymentMethod = 'payment_method';
}

class PaymentMethodCoordinator {
  static const autoRoute = AutoRoute(
      path: PaymentMethodRouters.paymentMethod,
      page: PaymentMethodPage,
      name: "PaymentMethodRoute");
}
