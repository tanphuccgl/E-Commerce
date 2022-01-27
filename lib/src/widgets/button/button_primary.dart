import 'package:flutter/material.dart';

class XButtonPrimary extends StatelessWidget {
  final String label;
  final double? width;
  final double height;
  final VoidCallback onPressed;
  const XButtonPrimary(
      {Key? key,
      required this.label,
      this.width,
      this.height = 36,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          label,
        ),
      ),
    );
  }
}
