import 'package:e_commerce/src/config/routes/coordinator.dart';
import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/constants/my_icons.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/modules/favorites/logic/favorites_bloc.dart';
import 'package:e_commerce/src/utils/utils.dart';
import 'package:e_commerce/src/widgets/button/button_add_bag.dart';
import 'package:e_commerce/src/widgets/label/discount_label.dart';
import 'package:e_commerce/src/widgets/label/new_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class XProductCardFavoriteHorizontal extends StatelessWidget {
  final XProduct data;
  const XProductCardFavoriteHorizontal({Key? key, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var numberStarActive = ((data.star).toInt() ~/ 5);
    var numberStarNoActive = 5 - numberStarActive;

    return data.soldOut
        ? _soldOutWidget()
        : GestureDetector(
            onTap: () => XCoordinator.showDetailProduct(context, data: data),
            child: SizedBox(
              height: 104,
              width: 343,
              child: Stack(
                children: [
                  Container(
                    height: 94,
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
                                topLeft: Radius.circular(8),
                                bottomLeft: Radius.circular(8)),
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
                            Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: 'Color: ',
                                    style: const TextStyle(
                                        fontSize: 11,
                                        height: 1,
                                        fontWeight: FontWeight.normal,
                                        color: MyColors.colorGray),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: '${data.color}',
                                          style: const TextStyle(
                                              color: MyColors.colorBlack)),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 60,
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: 'Size: ',
                                    style: const TextStyle(
                                        fontSize: 11,
                                        height: 1,
                                        fontWeight: FontWeight.normal,
                                        color: MyColors.colorGray),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: '${data.size}',
                                          style: const TextStyle(
                                              color: MyColors.colorBlack)),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                SizedBox(
                                  width: 60,
                                  child: data.discount == 0.0
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
                                            text:
                                                "${XUtils.formatPrice(data.originalPrice)}\$ ",
                                            style: const TextStyle(
                                                fontSize: 14,
                                                height: 1.42,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                color: MyColors.colorGray,
                                                fontWeight: FontWeight.w600),
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text:
                                                      "${XUtils.formatPrice(data.currentPrice ?? -1)}\$",
                                                  style: const TextStyle(
                                                    color:
                                                        MyColors.colorSaleHot,
                                                    decoration:
                                                        TextDecoration.none,
                                                  )),
                                            ],
                                          ),
                                        ),
                                ),
                                const SizedBox(
                                  width: 30,
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
                                              child: Image.asset(
                                                  MyIcons.activeStarIcon,
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
                                              child: Image.asset(
                                                  MyIcons.starIcon,
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
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 104,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: data.newProduct == true
                                    ? const NewLabel()
                                    : (data.discount != 0
                                        ? DisCountLabel(
                                            number: data.discount.toString())
                                        : const SizedBox.shrink()),
                              ),
                              BlocBuilder<FavoriteBloc, FavoriteState>(
                                builder: (context, state) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      child: const Icon(Icons.clear,
                                          color: MyColors.colorGray),
                                      onTap: () => context
                                          .read<FavoriteBloc>()
                                          .removeProduct(data),
                                    )),
                              )
                            ],
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: XButtonAddToBag(
                              isActive: true,
                              onPressed: () {},
                            ),
                          )
                        ]),
                  )
                ],
              ),
            ),
          );
  }

  Widget _soldOutWidget() {
    var numberStarActive = ((data.star).toInt() ~/ 5);
    var numberStarNoActive = 5 - numberStarActive;
    return SizedBox(
      height: 114,
      width: 343,
      child: Stack(
        children: [
          Container(
            height: 94,
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
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8)),
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
                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Color: ',
                            style: const TextStyle(
                                fontSize: 11,
                                height: 1,
                                fontWeight: FontWeight.normal,
                                color: MyColors.colorGray),
                            children: <TextSpan>[
                              TextSpan(
                                  text: '${data.color}',
                                  style: const TextStyle(
                                      color: MyColors.colorBlack)),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 60,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Size: ',
                            style: const TextStyle(
                                fontSize: 11,
                                height: 1,
                                fontWeight: FontWeight.normal,
                                color: MyColors.colorGray),
                            children: <TextSpan>[
                              TextSpan(
                                  text: '${data.size}',
                                  style: const TextStyle(
                                      color: MyColors.colorBlack)),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        SizedBox(
                          width: 60,
                          child: data.discount == 0.0
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
                                    text:
                                        "${XUtils.formatPrice(data.originalPrice)}\$ ",
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
                        ),
                        const SizedBox(
                          width: 30,
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
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: MyColors.colorWhite.withOpacity(0.5),
                height: 94,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: data.newProduct == true
                                ? const NewLabel()
                                : (data.discount != 0
                                    ? DisCountLabel(
                                        number: data.discount.toString())
                                    : const SizedBox.shrink()),
                          ),
                          BlocBuilder<FavoriteBloc, FavoriteState>(
                            builder: (context, state) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  child: const Icon(Icons.clear,
                                      color: MyColors.colorGray),
                                  onTap: () => context
                                      .read<FavoriteBloc>()
                                      .removeProduct(data),
                                )),
                          )
                        ],
                      ),
                    ]),
              ),
              const SizedBox(
                height: 2,
              ),
              const Text(
                "Sorry, this item is currently sold out",
                style: TextStyle(
                    color: MyColors.colorGray,
                    fontSize: 11,
                    height: 1,
                    fontWeight: FontWeight.normal),
              )
            ],
          )
        ],
      ),
    );
  }
}
