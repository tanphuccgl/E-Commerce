import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/src/modules/shipping_address/shipping_addresses/pages/shipping_addresses_page.dart';

class ShippingAddressRouters {
  static const String shippingAddress = 'shipping_address';
}

class ShippingAddressCoordinator {
  static const autoRoute = AutoRoute(
      path: ShippingAddressRouters.shippingAddress,
      page: ShippingAddressesPage,
      name: "ShippingAddressesRoute");
}
