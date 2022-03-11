import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:flutter/material.dart';

class XBottomSheet {
  static show(context, {required Widget widget}) async {
    const radius = Radius.circular(34);

    return await showModalBottomSheet<void>(
        isScrollControlled: true,
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topLeft: radius, topRight: radius)),
        backgroundColor: MyColors.colorWhite,
        builder: (BuildContext context) {
          return widget;
        });
  }
}
