import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/src/modules/view_all_products/logic/view_all_products_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeWrapperPage extends StatelessWidget {
  const HomeWrapperPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_) => ViewAllProductsBloc()),
    ], child: const Scaffold(body: AutoRouter()));
  }
}
