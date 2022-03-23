import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/modules/review/logic/review_bloc.dart';
import 'package:e_commerce/src/modules/review/logic/write_review_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsWrapperPage extends StatelessWidget {
  final XProduct data;
  const ProductDetailsWrapperPage({
    required this.data,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
          create: (_) => ReviewBloc(
                product: data,
              )),
      BlocProvider(create: (_) => WriteReviewBloc()),
    ], child: const Scaffold(body: AutoRouter()));
  }
}
