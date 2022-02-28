import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/constants/my_icons.dart';
import 'package:flutter/material.dart';

class XButtonAddToBag extends StatelessWidget {
  final bool isActive;
  final VoidCallback? onPressed;
  const XButtonAddToBag({Key? key, this.onPressed, required this.isActive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.height * 0.044,
      height: size.height * 0.044,
      child: isActive
          ? ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shadowColor: MyColors.colorPrimary,
                  primary: MyColors.colorPrimary,
                  onPrimary: MyColors.colorWhite,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  )),
              onPressed: onPressed,
              child: const Image(
                image: AssetImage(MyIcons.bagIcon),
              ))
          : ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shadowColor: MyColors.colorWhite,
                  primary: MyColors.colorWhite,
                  onPrimary: MyColors.colorPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  )),
              onPressed: onPressed,
              child: const Image(
                image: AssetImage(MyIcons.activeBagIcon),
              )),
    );
  }
}
