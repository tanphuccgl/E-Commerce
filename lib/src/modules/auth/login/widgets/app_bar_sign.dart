import 'package:flutter/material.dart';

// TODO: FOlder
class AppBarSign extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  // TODO: name
  final List<Widget>? action;
  final Function()? onPressed;
  final Widget? leading;
  const AppBarSign({
    Key? key,
    this.onPressed,
    this.title = '',
    this.action,
    this.leading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      actions: action,
      // TODO
      leading: leading,
      // automaticallyImplyLeading: true,
      iconTheme: const IconThemeData(color: Color(0xFF222222)),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  @override
  // TODO height
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
