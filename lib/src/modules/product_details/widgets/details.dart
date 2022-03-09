import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/constants/my_icons.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/utils/utils.dart';
import 'package:e_commerce/src/widgets/button/button_primary.dart';
import 'package:e_commerce/src/widgets/label/discount_label.dart';
import 'package:e_commerce/src/widgets/label/new_label.dart';
import 'package:flutter/material.dart';

class XDetails extends StatelessWidget {
  final XProduct data;
  const XDetails({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var numberStarActive = ((data.star).toInt() ~/ 5);
    var numberStarNoActive = 5 - numberStarActive;
    const String contentText =
        'Short dress in soft cotton jersey with decorative buttons down the front'
        ' and a wide, frill-trimmed square neckline with concealed elastication.'
        'Elasticated seam under the bust and short puff sleeves with a small frill trim.';
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                data.name,
                style: const TextStyle(
                    fontSize: 24,
                    height: 1.42,
                    color: MyColors.colorBlack,
                    fontWeight: FontWeight.w600),
              ),
              data.discount == 0.0
                  ? Text(
                      "${XUtils.formatPrice(data.originalPrice)}\$ ",
                      style: const TextStyle(
                          fontSize: 24,
                          height: 1.42,
                          color: MyColors.colorBlack,
                          fontWeight: FontWeight.w600),
                    )
                  : RichText(
                      text: TextSpan(
                        text: "${XUtils.formatPrice(data.originalPrice)}\$ ",
                        style: const TextStyle(
                            fontSize: 24,
                            height: 1.42,
                            decoration: TextDecoration.lineThrough,
                            color: MyColors.colorGray,
                            fontWeight: FontWeight.w600),
                        children: <TextSpan>[
                          TextSpan(
                              text:
                                  "${XUtils.formatPrice(data.currentPrice ?? -1)}\$",
                              style: const TextStyle(
                                color: MyColors.colorSaleHot,
                                decoration: TextDecoration.none,
                              )),
                        ],
                      ),
                    ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data.type,
                      style: const TextStyle(
                          color: MyColors.colorGray,
                          fontSize: 11,
                          fontWeight: FontWeight.normal,
                          height: 1)),
                  Row(
                    children: [
                      SizedBox(
                        height: 20,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                width: 13,
                                height: 12,
                                child: Image.asset(MyIcons.activeStarIcon,
                                    fit: BoxFit.scaleDown),
                              );
                            },
                            itemCount: numberStarActive),
                      ),
                      SizedBox(
                        height: 20,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                width: 13,
                                height: 12,
                                child: Image.asset(MyIcons.starIcon,
                                    fit: BoxFit.scaleDown),
                              );
                            },
                            itemCount: numberStarNoActive),
                      ),
                      const SizedBox(width: 3),
                      Text(
                        "(${data.star})",
                        style: const TextStyle(
                            fontSize: 10,
                            color: MyColors.colorGray,
                            fontWeight: FontWeight.normal),
                      )
                    ],
                  ),
                ],
              ),
              data.newProduct == true
                  ? const NewLabel()
                  : (data.discount != 0
                      ? DisCountLabel(number: data.discount.toString())
                      : const SizedBox.shrink()),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            contentText,
            style: TextStyle(
                height: 1.42,
                fontSize: 14,
                color: MyColors.colorBlack,
                fontWeight: FontWeight.normal),
          ),
          const SizedBox(
            height: 15,
          ),
          XButton(
            label: 'ADD TO CART',
            height: 48,
            onPressed: () {},
            width: double.infinity,
          )
        ],
      ),
    );
  }
}
