import 'package:e_commerce/src/modules/home/logic/product_bloc.dart';
import 'package:e_commerce/src/modules/home/widgets/banner.dart';
import 'package:e_commerce/src/modules/home/widgets/new_product.dart';
import 'package:e_commerce/src/modules/home/widgets/sale_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductBloc(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            const BannerHome(),
            Padding(
              padding: const EdgeInsets.only(left: 18),
              child: Column(
                children: const [
                  SaleProduct(),
                  SizedBox(
                    height: 30,
                  ),
                  NewProduct(),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
