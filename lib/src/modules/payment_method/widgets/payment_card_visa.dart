import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/constants/my_images.dart';
import 'package:flutter/material.dart';

class PaymentCardVisa extends StatelessWidget {
  const PaymentCardVisa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
      decoration: BoxDecoration(
          color: MyColors.colorGray,
          boxShadow: [
            BoxShadow(
                blurRadius: 25,
                offset: const Offset(0, 1),
                color: MyColors.colorWhite.withOpacity(0.08),
                spreadRadius: 1)
          ],
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Image.asset(
              MyImages.visaCardPayment,
              fit: BoxFit.cover,
            ),
          ),
          const Text(
            '* * * *  * * * *  * * * *  4546',
            style: TextStyle(
                fontSize: 22,
                color: MyColors.colorWhite,
                fontWeight: FontWeight.bold,
                height: 1),
          ),
          Image.asset(
            MyImages.chipCardPayment,
            fit: BoxFit.cover,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: const TextSpan(
                  text: 'Card Holder Name\n',
                  style: TextStyle(
                      fontSize: 10,
                      height: 1.42,
                      fontWeight: FontWeight.w600,
                      color: MyColors.colorWhite),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Jennyfer Doe',
                        style: TextStyle(
                          fontSize: 14,
                        )),
                  ],
                ),
              ),
              RichText(
                text: const TextSpan(
                  text: 'Expiry Date\n',
                  style: TextStyle(
                      fontSize: 10,
                      height: 1.42,
                      fontWeight: FontWeight.w600,
                      color: MyColors.colorWhite),
                  children: <TextSpan>[
                    TextSpan(
                        text: '11/22',
                        style: TextStyle(
                          fontSize: 14,
                        )),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
