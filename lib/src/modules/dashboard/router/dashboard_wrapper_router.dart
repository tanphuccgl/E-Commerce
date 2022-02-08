import 'package:e_commerce/src/modules/dashboard/logic/bottom_bar_bloc.dart';
import 'package:e_commerce/src/modules/dashboard/pages/aa.dart';
import 'package:e_commerce/src/modules/dashboard/pages/dashboard_page.dart';
import 'package:e_commerce/src/modules/dashboard/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeWrapperPage extends StatelessWidget {
  const HomeWrapperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const XBottomNavigationBar(),
      body: BlocBuilder<BottomBarBloc, BottomBarState>(
        builder: (context, state) {
          if (state.index == 0) {
            return const DashboardPage();
          } else if (state.index == 1) {
            return const APage();
          }
          return Container();
        },
      ),
    );
  }
}
