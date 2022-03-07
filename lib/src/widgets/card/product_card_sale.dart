import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/constants/my_icons.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/utils/utils.dart';
import 'package:e_commerce/src/widgets/button/button_add_favorite.dart';
import 'package:e_commerce/src/widgets/label/discount_label.dart';
import 'package:flutter/material.dart';

class XProductCardSale extends StatelessWidget {
  final XProduct data;
  const XProductCardSale({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var numberStarActive = ((data.star).toInt() ~/ 5);
    var numberStarNoActive = 5 - numberStarActive;
    return SizedBox(
      height: 260,
      width: 150,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 184,
                width: 148,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image(
                    fit: BoxFit.fill,
                    image: NetworkImage(data.image ?? "N/A"),
                  ),
                ),
              ),
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
                    "${data.star}",
                    style: const TextStyle(
                        fontSize: 10,
                        color: MyColors.colorGray,
                        fontWeight: FontWeight.normal),
                  )
                ],
              ),
              Text(
                data.name,
                style: const TextStyle(
                    fontSize: 11,
                    color: MyColors.colorGray,
                    fontWeight: FontWeight.normal),
              ),
              Text(
                data.type,
                style: const TextStyle(
                    fontSize: 16,
                    color: MyColors.colorBlack,
                    height: 1,
                    fontWeight: FontWeight.w600),
              ),
              RichText(
                text: TextSpan(
                  text: "${XUtils.formatPrice(data.originalPrice)}\$ ",
                  style: const TextStyle(
                      fontSize: 14,
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
          SizedBox(
            height: 200,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DisCountLabel(
                        number: XUtils.formatPrice(data.currentPrice ?? -1),
                      ),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.bottomRight,
                    child: XButtonAddToFavorite(
                      isActive: false,
                    ),
                  )
                ]),
          )
        ],
      ),
    );
  }
}
