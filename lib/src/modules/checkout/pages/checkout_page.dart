import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/modules/checkout/widgets/delivery_method_widget.dart';
import 'package:e_commerce/src/modules/checkout/widgets/payment_widget.dart';
import 'package:e_commerce/src/modules/dashboard/router/dashboard_router.dart';
import 'package:e_commerce/src/modules/shipping_address/shipping_addresses/widgets/shipping_address_widget.dart';
import 'package:e_commerce/src/modules/checkout/widgets/sums_widget.dart';
import 'package:e_commerce/src/widgets/app_bar/default_app_bar.dart';
import 'package:e_commerce/src/widgets/button/button_primary.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const XDefaultAppBar(
        backgroundColor: MyColors.colorWhite,
        elevation: 1,
        title: 'Checkout',
        style: TextStyle(
            color: MyColors.colorBlack,
            height: 1.42,
            fontWeight: FontWeight.w600,
            fontSize: 18),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ShippingAddressWidget(),
            const SizedBox(
              height: 30,
            ),
            const PaymentWidget(),
            const SizedBox(
              height: 30,
            ),
            const DeliveryMethodWidget(),
            const SizedBox(
              height: 30,
            ),
            const SumsWidget(),
            const SizedBox(
              height: 10,
            ),
            XButton(
              label: 'SUBMIT ORDER',
              height: 48,
              width: 343,
              onPressed: () => DashboardCoordinator.showSuccess(context),
            )
          ],
        ),
      ),
    );
  }
}
