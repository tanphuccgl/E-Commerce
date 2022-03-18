import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:flutter/material.dart';

class ShippingAddressWidget extends StatelessWidget {
  const ShippingAddressWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Shipping address',
          style: TextStyle(
              height: 1,
              fontSize: 16,
              color: MyColors.colorBlack,
              fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(12, 0, 23, 0),
          height: 108,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Jane Doe',
                      style: TextStyle(
                          fontSize: 14,
                          color: MyColors.colorBlack,
                          fontWeight: FontWeight.w500,
                          height: 1.42)),
                  TextButton(
                      onPressed: () {},
                      child: const Text('Change',
                          style: TextStyle(
                              fontSize: 14,
                              color: MyColors.colorPrimary,
                              fontWeight: FontWeight.w500,
                              height: 1.42)))
                ],
              ),
              RichText(
                text: const TextSpan(
                  text: '3 Newbridge Court\n',
                  style: TextStyle(
                      fontSize: 14,
                      height: 1.5,
                      fontWeight: FontWeight.normal,
                      color: MyColors.colorBlack),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Chino Hills, CA 91709, United States',
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
