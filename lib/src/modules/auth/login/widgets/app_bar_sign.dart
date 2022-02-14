import 'package:flutter/material.dart';

class AppBarSign extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? action;
  final Function()? onPressed;
  final Widget? leading;
  const AppBarSign(
      {Key? key, this.onPressed, this.title = '', this.action, this.leading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      actions: action,
      // leading: IconButton(
      //     icon: Image.asset(
      //       MyIcons.arrowBackIcon,
      //       color: MyColors.colorBlack,
      //     ),
      //     onPressed: onPressed ?? () => Navigator.pop(context)),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
