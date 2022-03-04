import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/modules/home/logic/product_bloc.dart';
import 'package:e_commerce/src/modules/product_by_category/widgets/header_delegate.dart';

import 'package:e_commerce/src/widgets/card/product_card_horizontal.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductByCategoryPage extends StatelessWidget {
  final String idCategory;
  final String nameCategory;
  const ProductByCategoryPage(
      {Key? key, required this.idCategory, required this.nameCategory})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.colorBackground2,
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            Theme(
              data: ThemeData(
                appBarTheme: const AppBarTheme(
                  iconTheme: IconThemeData(color: MyColors.colorBlack),
                ),
                textTheme: Theme.of(context).textTheme,
              ),
              child: SliverPersistentHeader(
                pinned: true,
                floating: true,
                delegate: HeaderDetailCategory(nameCategory: nameCategory),
              ),
            ),
            BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
              final data = state.items ?? [];
              List<XProduct> items =
                  data.where((e) => e.idCategory == idCategory).toList();
              return SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                    ),
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        child: XProductCardHorizontal(data: items[index])),
                  );
                }, childCount: items.length),
              );
            })
          ],
        ));
  }
}
