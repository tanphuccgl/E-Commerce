import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/src/widgets/button/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/login_bloc.dart';
import '../router/sign_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(title: const Text('Login')),
            body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  XButton(
                    label: "Login",
                    onPressed: () {
                      context.read<LoginBloc>().onLogin(context);
                    },
                  ),
                  const SizedBox(height: 32),
                  XButton(
                    label: "Navigation Register",
                    onPressed: () {
                      context.router.pushNamed(SignRouters.register);
                    },
                  ),
                ],
              ),
            ));
      },
    );
  }
}
