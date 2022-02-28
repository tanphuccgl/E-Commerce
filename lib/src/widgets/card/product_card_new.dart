import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/constants/my_icons.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/utils/utils.dart';
import 'package:e_commerce/src/widgets/button/button_add_favorite.dart';
import 'package:e_commerce/src/widgets/label/new_label.dart';
import 'package:flutter/material.dart';

class XProductCardNew extends StatelessWidget {
  final XProduct data;
  const XProductCardNew({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var numberStarActive = ((data.star ?? -1).toInt() ~/ 5);
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
                    style:const TextStyle(
                        fontSize: 10,
                        color: MyColors.colorGray,
                        fontWeight: FontWeight.normal),
                  )
                ],
              ),
              Text(
                "${data.name}",
                style: const TextStyle(
                    fontSize: 11,
                    color: MyColors.colorGray,
                    fontWeight: FontWeight.normal),
              ),
              Text(
                "${data.type}",
                style: const TextStyle(
                    fontSize: 16,
                    color: MyColors.colorBlack,
                    height: 1,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                "${XUtils.formatPrice(data.originalPrice ?? -1)}\$ ",
                style: const TextStyle(
                    fontSize: 14,
                    height: 1.42,
                    color: MyColors.colorBlack,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            height: 200,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: NewLabel(),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: XButtonAddToFavorite(
                      isActive: false,
                      onPressed: () {},
                    ),
                  )
                ]),
          )
        ],
      ),
    );
  }
}
