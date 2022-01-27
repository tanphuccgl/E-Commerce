import 'package:e_commerce/src/config/routes/page_routers.dart';
import 'package:flutter/material.dart';

class XNavigation {
  static pop(BuildContext context) {
    Navigator.of(context).pop();
  }

  static showLoginPage(BuildContext context) {
    Navigator.of(context).pushNamed(PageRoutes.loginPage);
  }

  static showRegisterPage(BuildContext context) {
    Navigator.of(context).pushNamed(PageRoutes.registerPage);
  }

  static showDashboardPage(BuildContext context) {
    Navigator.of(context).pushNamed(PageRoutes.dashboardPage);
  }
}
