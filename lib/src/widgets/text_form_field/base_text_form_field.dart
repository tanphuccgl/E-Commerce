import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/config/themes/style.dart';
import 'package:flutter/material.dart';

// TODO: add value field
// add action (clear button)
// add show/hide password - done
class XTextFormField extends StatelessWidget {
  final String label;
  final TextInputType textInputType;
  final bool obscureText;
  final Function(String) onChanged;
  final String errorText;
  final Widget? suffixIcon;
  final String? value;
  const XTextFormField(
      {Key? key,
      this.value,
      required this.label,
      this.suffixIcon,
      required this.onChanged,
      required this.errorText,
      this.obscureText = false,
      this.textInputType = TextInputType.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Container(
        height: 80,
        decoration: const BoxDecoration(boxShadow: [
          BoxShadow(
              color: MyColors.colorShadowTextFormField,
              offset: Offset(0, 1),
              spreadRadius: -25,
              blurRadius: 8)
        ]),
        child: TextFormField(
          style: XStyle.textTheme().titleSmall,
          onChanged: onChanged,
          decoration: InputDecoration(
              labelText: label,
              suffixIcon: suffixIcon,
              errorText: errorText,
              errorStyle: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
              border: InputBorder.none,
              hintText: label,
              labelStyle: XStyle.textTheme().labelLarge,
              hintStyle: XStyle.textTheme().titleSmall,
              fillColor: MyColors.colorWhite,
              filled: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 22)),
          keyboardType: textInputType,
          maxLines: 1,
          minLines: 1,
          textInputAction: TextInputAction.next,
          obscureText: obscureText,
        ),
      ),
    );
  }
}
