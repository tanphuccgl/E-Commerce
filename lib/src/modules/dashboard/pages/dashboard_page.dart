import 'package:e_commerce/src/modules/dashboard/widgets/bottom_bar.dart';
import 'package:e_commerce/src/widgets/button/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../auth/login/logic/login_bloc.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  // TODO: https://blog.logrocket.com/how-to-build-a-bottom-navigation-bar-in-flutter/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const XBottomNavigationBar(
        index: 0,
      ),
      // Body
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("DashboardPage"),
            XElevatedButton(
              label: "Logout ",
              onPressed: () {
                context.read<LoginBloc>().logout(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
