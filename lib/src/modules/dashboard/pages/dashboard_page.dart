import 'package:e_commerce/src/config/routes/page_routers.dart';
import 'package:e_commerce/src/models/prefs.dart';
import 'package:e_commerce/src/widgets/button/bottom_bar.dart';
import 'package:e_commerce/src/widgets/button/button_primary.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  static const String routeName = "/DashboardPage";
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const XBottomNavigationBar(
        index: 0,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("DashboardPage"),
            XButtonPrimary(
              label: "Logout ",
              onPressed: () {
                Prefs.logOut();
                Navigator.pushNamedAndRemoveUntil(context, PageRoutes.loginPage,
                    (Route<dynamic> route) => false);
           
              },
            ),
          ],
        ),
      ),
    );
  }
}
