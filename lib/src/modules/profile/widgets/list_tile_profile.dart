import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:flutter/material.dart';

class XFunctionProfile {
  final String title;
  final String subtitle;

  XFunctionProfile({required this.title, required this.subtitle});
  static List<XFunctionProfile> items = [
    XFunctionProfile(subtitle: 'Already have 12 orders', title: 'My orders'),
    XFunctionProfile(subtitle: '3 addresses', title: 'Shipping addresses'),
    XFunctionProfile(subtitle: 'Visa **34', title: 'Payment methods'),
    XFunctionProfile(
        subtitle: 'You have special promocodes', title: 'Promocodes'),
    XFunctionProfile(subtitle: 'Reviews for 4 items', title: 'My reviews'),
    XFunctionProfile(subtitle: 'Notifications, password', title: 'Settings'),
  ];
}

class ListTileProfile extends StatelessWidget {
  const ListTileProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final paddingContent =
        EdgeInsets.fromLTRB(size.width * 0.037, 0, size.width * 0.037, 0);

    return Column(
        children: ListTile.divideTiles(
            color: MyColors.colorGray,
            tiles: XFunctionProfile.items.map((item) => ListTile(
                  dense: true,
                  contentPadding: paddingContent,
                  onTap: () {},
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
