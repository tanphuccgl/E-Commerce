import 'package:e_commerce/src/modules/account/logic/account_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountBloc, AccountState>(builder: (context, state) {
      return Scaffold(
          appBar: AppBar(
            title: const Text("Home"),
            centerTitle: true,
          ),
          body: Center(
            child: Text(
              "Name: ${state.data?.name}\nEmail: ${state.data?.email}",
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ));
    });
  }
}
