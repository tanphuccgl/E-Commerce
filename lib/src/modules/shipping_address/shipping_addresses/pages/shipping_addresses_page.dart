import 'package:e_commerce/src/config/routes/coordinator.dart';
import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/config/themes/style.dart';
import 'package:e_commerce/src/modules/cart/widgets/icon_circle_button.dart';
import 'package:e_commerce/src/modules/shipping_address/shipping_addresses/widgets/card_shipping_addresses.dart';
import 'package:e_commerce/src/widgets/app_bar/default_app_bar.dart';
import 'package:flutter/material.dart';

class ShippingAddressesPage extends StatelessWidget {
  const ShippingAddressesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: XDefaultAppBar(
          leading: BackButton(onPressed: () => XCoordinator.pop(context)),
          backgroundColor: MyColors.colorBackground,
          elevation: 1,
          title: 'Shipping Addresses',
          style: XStyle.textTheme().headlineSmall),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView(
              padding: const EdgeInsets.only(top: 36),
              children: const <Widget>[
                CardShippingAddresses(),
                SizedBox(
                  height: 24,
                ),
                CardShippingAddresses(),
                SizedBox(
                  height: 24,
                ),
                CardShippingAddresses(),
              ],
            ),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: IconCircleButton(
                  icon: const Icon(Icons.add, color: MyColors.colorWhite),
                  primary: MyColors.colorBlack,
                  onPressed: () {},
                  onPrimary: MyColors.colorWhite,
                ),
              ))
        ],
      ),
    );
  }
}
