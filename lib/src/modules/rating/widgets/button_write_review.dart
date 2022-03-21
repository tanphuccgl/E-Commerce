import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:flutter/material.dart';

class XButtonWriteReview extends StatelessWidget {
  const XButtonWriteReview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ElevatedButton.icon(
        icon: const Icon(Icons.edit),
        onPressed: () {},
        label: const Text('Write a review',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: MyColors.colorWhite,
                fontSize: 11,
                fontWeight: FontWeight.w600,
                height: 1.2)),
      ),
    );
  }
}
