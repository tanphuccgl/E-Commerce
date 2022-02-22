import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:flutter/material.dart';

class AppBarSign extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Function()? onPressed;
  final Widget? leading;
  const AppBarSign({
    Key? key,
    this.onPressed,
    this.title = '',
    this.actions,
    this.leading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      actions: actions,
      leading: leading,
      iconTheme: const IconThemeData(color: MyColors.colorBlack),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
