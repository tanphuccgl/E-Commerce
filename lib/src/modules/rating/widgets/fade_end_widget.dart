import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/modules/rating/widgets/button_write_review.dart';
import 'package:flutter/material.dart';

class FadeEndWidget extends StatelessWidget {
  const FadeEndWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: 90,
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
            )),
        const Positioned(
          bottom: 0,
          right: 0,
          child: Padding(
            padding: EdgeInsets.all(17),
            child: XButtonWriteReview(),
          ),
        ),
      ],
    );
  }
}
