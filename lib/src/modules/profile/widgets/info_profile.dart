import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/config/themes/style.dart';
import 'package:flutter/material.dart';

class InfoProfile extends StatelessWidget {
  final String name;
  final String email;
  final String imageUrl;
  const InfoProfile(
      {Key? key,
      required this.email,
      required this.imageUrl,
      required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = EdgeInsets.symmetric(horizontal: size.width * 0.037);
    return Padding(
      padding: padding,
      child: SizedBox(
        width: size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: CircleAvatar(
                backgroundImage: NetworkImage(imageUrl),
                radius: size.width * 0.17,
                backgroundColor: MyColors.colorBackgroundAvatar,
              ),
            ),
            Expanded(flex: 8, child: _nameAndEmailUser())
          ],
        ),
      ),
    );
  }

  Widget _nameAndEmailUser() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 2, 0, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: XStyle.textTheme().headlineSmall),
          Text(email,
              style: const TextStyle(
                fontSize: 14,
                height: 1.42,
                color: MyColors.colorGray,
                fontWeight: FontWeight.w500,
              ))
        ],
      ),
    );
  }
}
