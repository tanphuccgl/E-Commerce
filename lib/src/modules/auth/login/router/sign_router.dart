import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/src/config/routes/auto_router.gr.dart';
import 'package:e_commerce/src/modules/auth/login/pages/login_page.dart';
import 'package:e_commerce/src/modules/auth/login/router/sign_wrapper_router.dart';
import 'package:e_commerce/src/modules/auth/register/pages/register_page.dart';
import 'package:flutter/cupertino.dart';

class SignRouters {
  static const String login = 'login';
  static const String register = 'register';
}

class SignCoordinator {
  static const autoRoute = AutoRoute(
    path: "/sign",
    name: "SignRouter",
    page: SignWrapperPage,
    children: [
      AutoRoute(path: SignRouters.login, page: LoginPage, initial: true),
      AutoRoute(path: SignRouters.register, page: RegisterPage),
      RedirectRoute(path: '*', redirectTo: ''),
    ],
  );
  static showRegister(BuildContext context) {
    context.router.pushNamed(SignRouters.register);
  }

  static showLogin(BuildContext context) {
    context.router.replace(const SignRouter());
  }

  static showForgotPassword() {}
}
