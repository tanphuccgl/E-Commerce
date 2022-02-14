import 'package:e_commerce/src/config/themes/style.dart';
import 'package:flutter/material.dart';

class HeaderSign extends StatelessWidget {
  final String title;
  const HeaderSign({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          title,
          style: XStyle.textTheme().headlineMedium,
        ),
      ),
    );
  }
}
