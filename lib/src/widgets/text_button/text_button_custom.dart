import 'package:e_commerce/src/constants/my_colors.dart';
import 'package:e_commerce/src/constants/my_icons.dart';
import 'package:flutter/material.dart';

class XTextButtonCus extends StatelessWidget {
  final String title;
  final Function() onPressed;
  const XTextButtonCus({Key? key, required this.title, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TextButton(
            onPressed: onPressed,
            child: Text(
              title,
              style: const TextStyle(
                  color: MyColors.colorBlack,
                  fontWeight: FontWeight.w500,
                  fontSize: 13),
            )),
        IconButton(
            onPressed: onPressed,
            icon: Image.asset(
              MyIcons.arrowIcon,
            ))
      ],
    );
  }
}
