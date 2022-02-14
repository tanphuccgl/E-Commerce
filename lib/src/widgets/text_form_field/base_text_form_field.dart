import 'package:e_commerce/src/config/themes/style.dart';
import 'package:e_commerce/src/constants/my_colors.dart';
import 'package:flutter/material.dart';

class XTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final TextInputType textInputType;
  final bool obscureText;
  final String Function(String?) validator;
  const XTextFormField(
      {Key? key,
      required this.controller,
      required this.label,
      required this.validator,
      this.obscureText = false,
      this.textInputType = TextInputType.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: MyColors.colorShadowTextFormField.withOpacity(0.1),
              offset: const Offset(0, 0),
              spreadRadius: 1,
              blurRadius: 10)
        ]),
        child: TextFormField(
          controller: controller,
          style: const TextStyle(
              fontFamily: "Metropolis",
              color: MyColors.colorBlack,
              fontSize: 18,
              fontWeight: FontWeight.w600),
          decoration: InputDecoration(
              labelText: label,
              border: InputBorder.none,
              hintText: label,
              labelStyle: XStyle.textTheme().titleSmall,
              hintStyle: XStyle.textTheme().headlineSmall,
              fillColor: Colors.white,
              filled: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 15)),
          keyboardType: textInputType,
          maxLines: 1,
          minLines: 1,
          textInputAction: TextInputAction.next,
          obscureText: obscureText,
          validator: validator,
        ),
      ),
    );
  }
}
