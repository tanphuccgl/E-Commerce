import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:flutter/material.dart';

class EndListDisplay extends StatelessWidget {
  const EndListDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
        child: Padding(
      padding: EdgeInsets.all(10),
      child: Center(
        child: Text(
          'End List',
          style: TextStyle(
              color: MyColors.colorPrimary,
              fontSize: 17,
              fontWeight: FontWeight.normal),
        ),
      ),
    ));
  }
}
