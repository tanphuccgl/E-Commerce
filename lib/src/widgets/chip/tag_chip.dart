import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:flutter/material.dart';

class TagChip extends StatelessWidget {
  final String label;
  const TagChip({Key? key, this.label = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.5),
      child: Container(
        height: 30,
        width: 100,
        decoration:const BoxDecoration(
            color: MyColors.colorBlack,
            borderRadius: BorderRadius.all(Radius.circular(29))),
        child: Center(
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: MyColors.colorWhite,
                fontSize: 14,
                height: 1,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
