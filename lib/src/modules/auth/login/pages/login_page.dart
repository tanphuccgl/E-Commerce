import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/src/widgets/button/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/routes/page_routers.dart';
import '../logic/login_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Scaffold(
            body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("LoginPage"),
              XElevatedButton(
                label: "Navigation Dashboard",
                onPressed: () {
                  context.read<LoginBloc>().onDashboard(context);
                },
              ),
              XElevatedButton(
                label: "Navigation Register",
                onPressed: () {
                  context.router.pushNamed(XRouteNames.register);
                },
              ),
            ],
          ),
        ));
      },
    );
  }
}
