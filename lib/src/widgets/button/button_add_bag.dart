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
    return SizedBox(
      width: 36,
      height: 36,
      child: isActive
          ? ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shadowColor: MyColors.colorPrimary,
                  primary: MyColors.colorPrimary,
                  onPrimary: MyColors.colorWhite,
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                  shape: const CircleBorder()),
              onPressed: () {},
              child: const Image(
                image: AssetImage(MyIcons.bagWhiteIcon)
              ))
          : ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shadowColor: MyColors.colorWhite,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  primary: MyColors.colorWhite,
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                  onPrimary: MyColors.colorPrimary,
                  shape: const CircleBorder()),
              onPressed: () {},
              child: const Image(
                image: AssetImage(MyIcons.activeBagIcon),
                height: 20,
                fit: BoxFit.fill,
              )),
    );
  }
}
