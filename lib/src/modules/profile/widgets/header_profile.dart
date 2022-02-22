import 'package:flutter/material.dart';

class HeaderProfile extends StatelessWidget {
  const HeaderProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = size.width * 0.037;
    return Padding(
      padding: EdgeInsets.fromLTRB(padding, size.height * 0.015, padding, 0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          "My Profile",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
