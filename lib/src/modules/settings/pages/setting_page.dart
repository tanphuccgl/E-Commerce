import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/modules/auth/widgets/app_bar_sign.dart';
import 'package:e_commerce/src/modules/settings/widgets/notifications_setting.dart';
import 'package:e_commerce/src/modules/settings/widgets/password_form.dart';
import 'package:e_commerce/src/modules/settings/widgets/personal_info_form.dart';
import 'package:e_commerce/src/widgets/header/header.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sizeHeightBody = size.height - MediaQuery.of(context).padding.top;
    final padding = size.width * 0.037;

    return Scaffold(
        appBar: AppBarSign(actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: MyColors.colorBlack,
              ))
        ]),
        body: SingleChildScrollView(
          child: SizedBox(
            height: sizeHeightBody,
            child: Padding(
              padding: EdgeInsets.fromLTRB(padding, 0, padding, 0),
              child: Column(
                children: [
                  const XHeader(title: "Settings"),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  const PersonalInfoForm(),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  const PasswordForm(),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  const NotificationsSetting(),
                ],
              ),
            ),
          ),
        ));
  }
}
