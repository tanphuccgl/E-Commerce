import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/config/themes/style.dart';
import 'package:e_commerce/src/modules/cart/widgets/icon_circle_button.dart';
import 'package:e_commerce/src/modules/payment_method/router/payment_method_router.dart';
import 'package:e_commerce/src/modules/payment_method/widgets/payment_card_master.dart';
import 'package:e_commerce/src/modules/payment_method/widgets/payment_card_visa.dart';
import 'package:e_commerce/src/widgets/app_bar/default_app_bar.dart';
import 'package:flutter/material.dart';

class PaymentMethodPage extends StatelessWidget {
  const PaymentMethodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: XDefaultAppBar(
          backgroundColor: MyColors.colorBackground,
          elevation: 1,
          title: 'Payment methods',
          style: XStyle.textTheme().headlineSmall),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: Text(
                    'Your payment cards',
                    style: TextStyle(
                        color: MyColors.colorBlack,
                        fontSize: 16,
                        height: 1,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      const PaymentCardMaster(),
                      _paymentMethodDefault(),
                      const PaymentCardVisa(),
                      _paymentMethodDefault(),
                    ],
                  ),
                ),
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
                  onPressed: () =>
                      PaymentMethodCoordinator.showBottomSheetNewPayment(
                          context),
                  onPrimary: MyColors.colorWhite,
                ),
              ))
        ],
      ),
    );
  }
}

Widget _paymentMethodDefault() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Checkbox(
        value: true,
        activeColor: MyColors.colorBlack,
        onChanged: (value) {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
      ),
      const Text(
        'Use as default payment method',
        style: TextStyle(
            color: MyColors.colorBlack,
            height: 1.42,
            fontSize: 14,
            fontWeight: FontWeight.normal),
      )
    ],
  );
}
