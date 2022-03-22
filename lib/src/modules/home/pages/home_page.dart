import 'package:e_commerce/src/modules/home/widgets/banner.dart';
import 'package:e_commerce/src/modules/home/widgets/new_product.dart';
import 'package:e_commerce/src/modules/home/widgets/sale_product.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const _space = SizedBox(height: 30);
    return Scaffold(
        body: CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.transparent,
          stretch: true,
          expandedHeight: size.height * 0.24,
          flexibleSpace: const FlexibleSpaceBar(
            stretchModes: [
              StretchMode.blurBackground,
              StretchMode.zoomBackground
            ],
            background: BannerHome(),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 18, top: 37),
              child: Column(
                children: const [
                  SaleProduct(),
                  _space,
                  NewProduct(),
                  _space,
                ],
              ),
            );
          }, childCount: 1),
        ),
        // TODO: implement a new SliverList for product by category. do forget use slider_product.dart
      ],
    ));
  }
}
