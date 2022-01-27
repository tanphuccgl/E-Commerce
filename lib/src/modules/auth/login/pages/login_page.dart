import 'package:e_commerce/src/config/routes/navigation.dart';
import 'package:e_commerce/src/models/prefs.dart';
import 'package:e_commerce/src/widgets/button/button_primary.dart';
import 'package:e_commerce/src/widgets/snackbar/snackbar.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = "/LoginPage";
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("LoginPage"),
            XButtonPrimary(
              label: "Navigation Dashboard",
              onPressed: () {
                Prefs.saveLogin();
                XNavigation.showDashboardPage(context);
                XSnackBar.show(msg: "Logged in successfully");
                
              },
            ),
            XButtonPrimary(
              label: "Navigation Register",
              onPressed: () {
                XNavigation.showRegisterPage(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
