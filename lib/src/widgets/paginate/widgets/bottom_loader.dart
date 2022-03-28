import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:flutter/material.dart';

class BottomLoader extends StatelessWidget {
  const BottomLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
        child: Padding(
      padding: EdgeInsets.all(5),
      child: SizedBox(
        height: 40,
        width: 30,
        child: Center(
          child: Center(
            child: CircularProgressIndicator(color: MyColors.colorPrimary),
          ),
        ),
      ),
    ));
  }
}
