import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/constants/my_icons.dart';
import 'package:flutter/material.dart';

class FilerBar extends StatelessWidget {
  const FilerBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      color: MyColors.colorBackground,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_filter(), _sort(), _viewType()],
      ),
    );
  }

  Widget _filter() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          primary: MyColors.colorBackground,
          onPrimary: MyColors.colorBackground,
          shadowColor: MyColors.colorWhite,
          elevation: 0),
      child: Row(
        children: [
          Image.asset(
            MyIcons.filterIcon,
            color: MyColors.colorBlack,
          ),
          const SizedBox(
            width: 11,
          ),
          const Text(
            'Filter',
            style: TextStyle(
                color: MyColors.colorBlack,
                fontSize: 11,
                fontWeight: FontWeight.normal),
          )
        ],
      ),
    );
  }

  Widget _sort() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          primary: MyColors.colorBackground,
          onPrimary: MyColors.colorBackground,
          shadowColor: MyColors.colorWhite,
          elevation: 0),
      child: Row(
        children: [
          Image.asset(
            MyIcons.sortIcon,
            color: MyColors.colorBlack,
          ),
          const SizedBox(
            width: 11,
          ),
          const Text(
            'Price: lowest to high',
            style: TextStyle(
                color: MyColors.colorBlack,
                fontSize: 11,
                fontWeight: FontWeight.normal),
          )
        ],
      ),
    );
  }

  Widget _viewType() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: MyColors.colorBackground,
          onPrimary: MyColors.colorBackground,
          shadowColor: MyColors.colorWhite,
          elevation: 0),
      onPressed: () {},
      child: Row(
        children: [
          Image.asset(
            MyIcons.gridIcon,
            color: MyColors.colorBlack,
          ),
        ],
      ),
    );
  }
}
