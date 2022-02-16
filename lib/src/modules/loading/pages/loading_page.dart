import 'package:e_commerce/src/modules/account/logic/account_bloc.dart';
import 'package:e_commerce/src/modules/auth/login/router/sign_router.dart';
import 'package:e_commerce/src/modules/dashboard/router/dashboard_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AccountBloc, AccountState>(
      listener: (BuildContext context, state) {
        if (state.isLoading == false) {
          if (state.data != null) {
            DashboardCoordinator.showDashboard(context);
          } else {
            SignCoordinator.showSignUp(context);
          }
        }
      },
      child: const Scaffold(
        body: Center(child: Text('Loading....')),
      ),
    );
  }
}
