import 'package:e_commerce/src/config/routes/coordinator.dart';
import 'package:e_commerce/src/modules/auth/login/logic/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (BuildContext context, state) {
        if (state.isLogin != null) {
          if (state.isLogin == true) {
            XCoordinator.showDashboard();
          } else {
            XCoordinator.showLogin();
          }
        }
      },
      child: const Scaffold(
        body: Center(child: Text('Loading....')),
      ),
    );
  }
}
