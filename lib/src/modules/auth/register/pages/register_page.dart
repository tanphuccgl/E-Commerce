import 'package:e_commerce/src/modules/auth/login/logic/login_bloc.dart';
import 'package:e_commerce/src/widgets/button/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            XButton(
              label: "Register Account ",
              onPressed: () {
                context.read<LoginBloc>().onRegister(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
