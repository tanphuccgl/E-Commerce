import 'package:e_commerce/src/widgets/button/button_primary.dart';
import 'package:e_commerce/src/widgets/dialogs/dialogs.dart';
import 'package:flutter/material.dart';

import '../../../../config/routes/navigation.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("RegisterPage"),
            XElevatedButton(
              label: "Navigation LoginPage ",
              onPressed: () {
                XNavigation.pop();
              },
            ),
            XElevatedButton(
              label: "Register Account ",
              onPressed: () {
                XDialog.showAlertSuccess(content: "Successful register ");
              },
            ),
          ],
        ),
      ),
    );
  }
}
