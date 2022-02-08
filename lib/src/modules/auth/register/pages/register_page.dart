import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/src/widgets/button/button_primary.dart';
import 'package:e_commerce/src/widgets/dialogs/dialogs.dart';
import 'package:flutter/material.dart';


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
                context.router.pop();
              },
            ),
            XElevatedButton(
              label: "Register Account ",
              onPressed: () {
                XDialog.show(title: "Successful register ");
              },
            ),
          ],
        ),
      ),
    );
  }
}
