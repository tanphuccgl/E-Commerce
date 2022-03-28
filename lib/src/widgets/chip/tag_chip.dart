import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/modules/shop/router/shop_router.dart';
import 'package:flutter/material.dart';

class TagChip extends StatelessWidget {
  final String label;
  final String idCategory;
  final bool unSelectTagChip;
  const TagChip(
      {Key? key,
      required this.label,
      required this.idCategory,
      this.unSelectTagChip = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.5),
      child: SizedBox(
        height: 30,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: MyColors.colorBlack,
              elevation: 0,
              onPrimary: MyColors.colorWhite,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(29),
              )),
          onPressed: unSelectTagChip
              ? () {}
              : () => ShopCoordinator.switchCategory(context,
                  idCategory: idCategory, nameCategory: label),
          child: Center(
            child: Text(
              label,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: const TextStyle(
                  color: MyColors.colorWhite,
                  fontSize: 14,
                  height: 1,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}
