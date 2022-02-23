import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:flutter/material.dart';

class XFunctionProfile {
  final String title;
  final String subtitle;
  final Function()? onTap;

  XFunctionProfile(
      {required this.title, required this.subtitle, required this.onTap});
  static List<XFunctionProfile> items = [
    XFunctionProfile(
        subtitle: 'Already have 12 orders', title: 'My orders', onTap: () {}),
    XFunctionProfile(
        subtitle: '3 addresses', title: 'Shipping addresses', onTap: () {}),
    XFunctionProfile(
        subtitle: 'Visa **34', title: 'Payment methods', onTap: () {}),
    XFunctionProfile(
        subtitle: 'You have special promocodes',
        title: 'Promocodes',
        onTap: () {}),
    XFunctionProfile(
        subtitle: 'Reviews for 4 items', title: 'My reviews', onTap: () {}),
    XFunctionProfile(
        subtitle: 'Notifications, password', title: 'Settings', onTap: () {}),
  ];
}

class ListTileProfile extends StatelessWidget {
  const ListTileProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = size.width * 0.037;
    final paddingContent = EdgeInsets.fromLTRB(padding, 0, padding, 0);

    return Column(
        children: ListTile.divideTiles(
            color: MyColors.colorGray,
            tiles: XFunctionProfile.items.map((item) => ListTile(
                  dense: true,
                  contentPadding: paddingContent,
                  onTap: () => item.onTap!(),
                  title: Text(item.title,
                      style: const TextStyle(
                          fontSize: 16,
                          height: 1,
                          color: MyColors.colorBlack,
                          fontWeight: FontWeight.w600)),
                  subtitle: Text(item.subtitle,
                      style: const TextStyle(
                          fontSize: 11,
                          height: 1,
                          color: MyColors.colorGray,
                          fontWeight: FontWeight.normal)),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: MyColors.colorGray,
                  ),
                ))).toList());
  }
}
