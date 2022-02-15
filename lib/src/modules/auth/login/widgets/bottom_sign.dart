import 'package:e_commerce/src/constants/my_colors.dart';
import 'package:e_commerce/src/constants/my_icons.dart';
import 'package:flutter/material.dart';

// TODO: folder
class BottomSign extends StatelessWidget {
  final String title;
  const BottomSign({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
              color: MyColors.colorBlack,
              fontSize: 15,
              fontWeight: FontWeight.w500),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _socialButton(MyIcons.ggIcon, onPressed: () {}),
            _socialButton(MyIcons.fbIcon, onPressed: () {})
          ],
        ),
      ],
    );
  }
}

Widget _socialButton(String image, {required Function() onPressed}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
      width: 80,
      height: 60,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Image.asset(image),
        style: ElevatedButton.styleFrom(
          primary: MyColors.colorWhite,
        ),
      ),
    ),
  );
}
