import 'package:e_commerce/src/config/routes/coordinator.dart';
import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:flutter/material.dart';

class ListTileDetailProduct extends StatelessWidget {
  const ListTileDetailProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> _items = ['Rating and reviews', 'Shipping info', 'Support'];
    return Column(
        children: ListTile.divideTiles(
            color: MyColors.colorGray,
            tiles: _items.map((item) => ListTile(
                  dense: true,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  onTap: () {
                    switch (item) {
                      case 'Rating and reviews':
                        XCoordinator.showRatings(context);
                        break;
                      default:
                    }
                  },
                  title: Text(item,
                      style: const TextStyle(
                          fontSize: 16,
                          height: 1,
                          color: MyColors.colorBlack,
                          fontWeight: FontWeight.normal)),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 15,
                    color: MyColors.colorBlack,
                  ),
                ))).toList());
  }
}
