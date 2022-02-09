import 'package:e_commerce/src/modules/dashboard/logic/bottom_bar_bloc.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardWrapperPage extends StatelessWidget {
  const DashboardWrapperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => BottomBarBloc(),
        child: const Scaffold(body: AutoRouter()));
  }
}
