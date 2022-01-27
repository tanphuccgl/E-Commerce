import 'package:e_commerce/src/config/routes/navigation.dart';
import 'package:e_commerce/src/widgets/button/button_primary.dart';
import 'package:e_commerce/src/widgets/dialogs/dialogs.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  // TODO: Move to PageRoutes
  static const String routeName = "/RegisterPage";
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
            XButtonPrimary(
              label: "Navigation LoginPage ",
              onPressed: () {
                XNavigation.pop(context);
              },
            ),
            XButtonPrimary(
              label: "Register Account ",
              onPressed: () {
                XDialog.showAlertSuccess(context,
                    content: "Successful register ");
              },
            ),
          ],
        ),
      ),
    );
  }
}
