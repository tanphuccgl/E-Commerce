import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/config/themes/style.dart';
import 'package:e_commerce/src/widgets/button/button_primary.dart';
import 'package:e_commerce/src/widgets/text_field/base_text_field.dart';
import 'package:flutter/material.dart';

class XBottomSheet extends StatelessWidget {
  const XBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = size.width * 0.037;

    return SizedBox(
      height: size.height * 0.58,
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Password Change',
                style: XStyle.textTheme().headlineSmall,
              ),
              const SizedBox(
                height: 5,
              ),
              XTextField(
                  label: "Old Password",
                  value: "",
                  textInputType: TextInputType.visiblePassword,
                  obscureText: true,
                  errorText: "Error",
                  onChanged: (value) {}),
              Align(
                alignment: Alignment.topRight,
                child: SizedBox(
                  height: 25,
                  child: TextButton(
                      onPressed: () {},
                      child: const Text("Forgot Password",
                          style: TextStyle(
                              color: MyColors.colorGray,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 0.5))),
                ),
              ),
              XTextField(
                  label: "New Password",
                  value: "",
                  textInputType: TextInputType.visiblePassword,
                  obscureText: true,
                  errorText: "Error",
                  onChanged: (value) {}),
              XTextField(
                  label: "Repeat New Password",
                  value: "",
                  textInputType: TextInputType.visiblePassword,
                  obscureText: true,
                  errorText: "Error",
                  onChanged: (value) {}),
              const SizedBox(
                height: 5,
              ),
              XButton(
                label: 'SAVE PASSWORD',
                width: size.width,
                height: size.height * 0.059,
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
