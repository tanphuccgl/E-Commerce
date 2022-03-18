import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/constants/my_images.dart';
import 'package:flutter/material.dart';

class DeliveryMethodWidget extends StatelessWidget {
  const DeliveryMethodWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> deliveryList = [
      MyImages.fedexDelivery,
      MyImages.uspsDelivery,
      MyImages.dhlDelivery
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Delivery method',
          style: TextStyle(
              height: 1,
              fontSize: 16,
              color: MyColors.colorBlack,
              fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 72,
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: deliveryList
                .map((e) => Padding(
                      padding: const EdgeInsets.only(right: 22),
                      child: _cardDelivery(e),
                    ))
                .toList(),
          ),
        )
      ],
    );
  }
}

Widget _cardDelivery(String name) {
  return Container(
    height: 72,
    width: 100,
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
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(name),
        const SizedBox(
          height: 11,
        ),
        const Text(
          '2-3 days',
          style: TextStyle(
              fontSize: 11,
              height: 1,
              color: MyColors.colorGray,
              fontWeight: FontWeight.normal),
        )
      ],
    ),
  );
}
