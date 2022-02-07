import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../auth/login/logic/login_bloc.dart';
import '../../auth/login/pages/login_page.dart';
import '../../dashboard/pages/dashboard_page.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      if (state.isLogin == true) {
        return const DashboardPage();
      } else {
        return const LoginPage();
      }
    });
  }
}
