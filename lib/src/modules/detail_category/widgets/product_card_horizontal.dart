import 'package:e_commerce/src/config/routes/coordinator.dart';
import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/constants/my_icons.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/utils/utils.dart';
import 'package:e_commerce/src/widgets/button/button_add_favorite.dart';
import 'package:e_commerce/src/widgets/label/discount_label.dart';
import 'package:e_commerce/src/widgets/label/new_label.dart';
import 'package:flutter/material.dart';

class XProductCardHorizontal extends StatelessWidget {
  final XProduct data;
  const XProductCardHorizontal({Key? key, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => XCoordinator.showDetailProduct(context, data: data),
      child: SizedBox(
        height: 114,
        width: 343,
        child: Stack(
          children: [
            _belowCard(),
            SizedBox(
              height: 114,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: data.newProduct == true
                            ? const NewLabel()
                            : (data.discount != 0
                                ? DisCountLabel(
                                    number: data.discount.toString())
                                : const SizedBox.shrink()),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: XButtonAddToFavorite(
                        data: data,
                      ),
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }

  Widget _belowCard() {
    var numberStarActive = ((data.star).toInt() ~/ 5);
    var numberStarNoActive = 5 - numberStarActive;

    return Container(
      height: 104,
      decoration: const BoxDecoration(
          color: MyColors.colorWhite,
          boxShadow: [
            BoxShadow(
                blurRadius: 25,
                offset: Offset(0, 1),
                color: MyColors.colorWhite,
                spreadRadius: 1)
          ],
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 104,
            width: 104,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
              child: Image(
                fit: BoxFit.fill,
                image: NetworkImage(data.image ?? "N/A"),
              ),
            ),
          ),
          const SizedBox(
            width: 11,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.type,
                style: const TextStyle(
                    fontSize: 16,
                    color: MyColors.colorBlack,
                    height: 1,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                data.name,
                style: const TextStyle(
                    fontSize: 11,
                    color: MyColors.colorGray,
                    fontWeight: FontWeight.normal),
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
                    "(${data.star})",
                    style: const TextStyle(
                        fontSize: 10,
                        color: MyColors.colorGray,
                        fontWeight: FontWeight.normal),
                  )
                ],
              ),
              data.discount == 0.0
                  ? Text(
                      "${XUtils.formatPrice(data.originalPrice)}\$ ",
                      style: const TextStyle(
                          fontSize: 14,
                          height: 1.42,
                          color: MyColors.colorBlack,
                          fontWeight: FontWeight.w600),
                    )
                  : RichText(
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
        ],
      ),
    );
  }
}
