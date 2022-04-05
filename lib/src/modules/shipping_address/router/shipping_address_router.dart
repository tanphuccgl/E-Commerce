import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/src/modules/shipping_address/adding_shipping_address/pages/adding_shipping_address_page.dart';
import 'package:e_commerce/src/modules/shipping_address/router/shipping_address_wrapper_router.dart';
import 'package:e_commerce/src/modules/shipping_address/shipping_addresses/pages/shipping_addresses_page.dart';

class ShippingAddressRouters {
  static const String shippingAddress = 'shipping_address';
  static const String addShippingAddress = 'add_shipping_address';
}

class ShippingAddressCoordinator {
  static const autoRoute = AutoRoute(
      path: ShippingAddressRouters.shippingAddress,
      page: ShippingAddressWrapperPage,
      name: "ShippingAddressesWrapperRoute",
      children: [
        AutoRoute(
          path: '',
          page: ShippingAddressesPage,
          name: "ShippingAddressesRoute",
        ),
        AutoRoute(
          path: ShippingAddressRouters.addShippingAddress,
          page: AddShippingAddressPage,
          name: "AddShippingAddressRoute",
        ),
      ]);
}
