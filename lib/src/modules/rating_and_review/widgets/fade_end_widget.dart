import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:flutter/material.dart';

class FadeEndWidget extends StatelessWidget {
  const FadeEndWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [0.0, 0.78],
          colors: [
            MyColors.colorWhite.withOpacity(0.22),
            MyColors.colorWhite.withOpacity(1),
          ],
        ),
      ),
    );
  }
}
