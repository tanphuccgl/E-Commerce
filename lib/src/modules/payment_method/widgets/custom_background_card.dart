import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:flutter/material.dart';

class CustomBackgroundCard extends StatelessWidget {
  const CustomBackgroundCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        // CustomPaint(
        //   painter: CirclePainter(),
        // ),
        // CustomPaint(
        //   painter: CirclePainter(),
        // ),
      ],
    );
  }
}

class CirclePainter extends CustomPainter {
  final Paint bluePaint = Paint()..color = MyColors.colorPrimary;

  @override
  void paint(Canvas canvas, Size size) {
    var rect = Rect.fromLTRB(-200, -200, size.width / 2.5, size.width / 1.8);

    final Path circle = Path()..addOval(rect);

    canvas.drawPath(circle, bluePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
