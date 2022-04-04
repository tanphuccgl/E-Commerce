import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:flutter/material.dart';

class CardShippingAddresses extends StatelessWidget {
  const CardShippingAddresses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 0, 23, 0),
      height: 140,
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
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 0, 0, 0),
            child: Row(
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
                    child: const Text('Edit',
                        style: TextStyle(
                            fontSize: 14,
                            color: MyColors.colorPrimary,
                            fontWeight: FontWeight.w500,
                            height: 1.42)))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 0, 0, 0),
            child: RichText(
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
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
              child: _shippingAddressDefault())
        ],
      ),
    );
  }
}

Widget _shippingAddressDefault() {
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
        'Use as the shipping address',
        style: TextStyle(
            color: MyColors.colorBlack,
            height: 1.42,
            fontSize: 14,
            fontWeight: FontWeight.normal),
      )
    ],
  );
}