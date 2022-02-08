import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/src/modules/auth/login/logic/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignWrapperPage extends StatelessWidget {
  const SignWrapperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: const Scaffold(
        body: AutoRouter(),
      ),
    );
  }
}