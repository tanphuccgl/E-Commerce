import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/constants/my_icons.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/widgets/button/button_add_bag.dart';
import 'package:e_commerce/src/widgets/label/new_label.dart';
import 'package:flutter/material.dart';

class XProductCardFavorite extends StatelessWidget {
  final XProduct data;
  const XProductCardFavorite({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 284,
      width: 164,
      child: Stack(
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 184,
                width: 164,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image(
                    image: NetworkImage(data.image ?? ""),
                  ),
                ),
              ),
              Row(
                children: const [
                  Image(image: AssetImage(MyIcons.starIcon)),
                  Image(image: AssetImage(MyIcons.starIcon)),
                  Image(image: AssetImage(MyIcons.starIcon)),
                  Image(image: AssetImage(MyIcons.starIcon)),
                  Image(image: AssetImage(MyIcons.starIcon)),
                  Text("(10)",style: TextStyle(fontSize: 10,color: MyColors.colorGray,fontWeight: FontWeight.normal),)
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
                    color: MyColors.colorBlack,height: 1,
                    fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Color: ',
                      style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.normal,
                          color: MyColors.colorGray),
                      children: <TextSpan>[
                        TextSpan(
                            text: '${data.color}',
                            style: const TextStyle(color: MyColors.colorBlack)),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Size: ',
                      style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.normal,
                          color: MyColors.colorGray),
                      children: <TextSpan>[
                        TextSpan(
                            text: '${data.size}',
                            style: const TextStyle(color: MyColors.colorBlack)),
                      ],
                    ),
                  )
                ],
              ),
              Text(
                "${data.originalPrice}\$",
                style: const TextStyle(
                    fontSize: 16,
                    color: MyColors.colorBlack,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            height: 229,
            width: 164,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,


                    children: [
                      const NewLabel(),
                      IconButton(onPressed: () {}, icon:
                       Image.asset(MyIcons.cancelIcon),splashRadius: 20,iconSize: 12,alignment: 
                       Alignment.topRight,
                       )
                    ],
                  ),
                  const XButtonAddToBag(isActive: true)
                ]),
          )
        ],
      ),
    );
  }
}
