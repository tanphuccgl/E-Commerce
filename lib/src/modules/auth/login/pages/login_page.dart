import 'package:e_commerce/src/modules/account/logic/account_bloc.dart';
import 'package:e_commerce/src/modules/auth/login/router/sign_router.dart';
import 'package:e_commerce/src/widgets/button/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountBloc, AccountState>(
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
                      context.read<AccountBloc>().onLogin(context);
                    },
                  ),
                  const SizedBox(height: 32),
                  XButton(
                    label: "Navigation Register",
                    onPressed: () {
                      SignCoordinator.showRegister(context);
                      //   context.router.pushNamed(SignRouters.register);
                    },
                  ),
                ],
              ),
            ));
      },
    );
  }
}
