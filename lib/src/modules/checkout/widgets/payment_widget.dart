import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/constants/my_images.dart';
import 'package:e_commerce/src/modules/dashboard/router/dashboard_router.dart';
import 'package:flutter/material.dart';

class PaymentWidget extends StatelessWidget {
  const PaymentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Payment',
                style: TextStyle(
                    height: 1,
                    fontSize: 16,
                    color: MyColors.colorBlack,
                    fontWeight: FontWeight.w600),
              ),
              TextButton(
                  onPressed: () =>
                      DashboardCoordinator.showPaymentMethod(context),
                  child: const Text('Change',
                      style: TextStyle(
                          fontSize: 14,
                          color: MyColors.colorPrimary,
                          fontWeight: FontWeight.w500,
                          height: 1.42)))
            ],
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                height: 38,
                width: 64,
                decoration: BoxDecoration(
                    color: MyColors.colorWhite,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 25,
                          offset: const Offset(0, 1),
                          color: MyColors.colorWhite.withOpacity(0.08),
                          spreadRadius: 1)
                    ],
                    borderRadius: const BorderRadius.all(Radius.circular(8))),
                child: Center(
                  child: Image.asset(MyImages.masterCardPayment,
                      fit: BoxFit.cover),
                )),
            const SizedBox(
              width: 17,
            ),
            const Text(
              '**** **** **** 3947',
              style: TextStyle(
                  color: MyColors.colorBlack,
                  height: 1.5,
                  fontSize: 14,
                  fontWeight: FontWeight.normal),
            )
          ],
        )
      ],
    );
  }
}
