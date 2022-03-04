import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/modules/home/logic/product_bloc.dart';
import 'package:e_commerce/src/modules/product_by_category/logic/product_by_category_bloc.dart';

import 'package:e_commerce/src/modules/product_by_category/widgets/header_delegate.dart';
import 'package:e_commerce/src/widgets/card/product_card_gird.dart';

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
    var index = 3;
    return BlocBuilder<ProductByCategoryBloc, ProductByCategoryState>(
        builder: (context, state) {
      index = state.sortBy.index;
      return Scaffold(
          backgroundColor: state.isListViewType
              ? MyColors.colorBackground2
              : MyColors.colorWhite,
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
                  delegate: HeaderDetailCategory(
                    nameCategory: nameCategory,
                  ),
                ),
              ),
              BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
                final data = state.items ?? [];
                List<XProduct> items =
                    data.where((e) => e.idCategory == idCategory).toList();
                switch (index) {
                  case 0:
                    break;
                  case 1:
                    items.sort((a, b) {
                      int item1 = (a.newProduct ?? true) ? 1 : 0;
                      int item2 = (b.newProduct ?? true) ? 1 : 0;

                      return item2.compareTo(item1);
                    });
                    break;
                  case 2:
                    items.sort((a, b) {
                      int item1 = a.star;
                      int item2 = b.star;

                      return item2.compareTo(item1);
                    });

                    break;
                  case 3:
                    items.sort((a, b) {
                      double item1 = (a.currentPrice ?? -1) > 0
                          ? (a.currentPrice ?? -1)
                          : (a.originalPrice);
                      double item2 = (b.currentPrice ?? -1) > 0
                          ? (b.currentPrice ?? -1)
                          : (b.originalPrice);

                      return item1.compareTo(item2);
                    });
                    break;
                  case 4:
                    items.sort((a, b) {
                      double item1 = (a.currentPrice ?? -1) > 0
                          ? (a.currentPrice ?? -1)
                          : (a.originalPrice);
                      double item2 = (b.currentPrice ?? -1) > 0
                          ? (b.currentPrice ?? -1)
                          : (b.originalPrice);

                      return item2.compareTo(item1);
                    });
                    break;
                  default:
                }

                return BlocBuilder<ProductByCategoryBloc,
                    ProductByCategoryState>(builder: (context, state) {
                  return state.isListViewType
                      ? SliverList(
                          delegate:
                              SliverChildBuilderDelegate((context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                              ),
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 16),
                                  child: XProductCardHorizontal(
                                      data: items[index])),
                            );
                          }, childCount: items.length),
                        )
                      : SliverGrid(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 0,
                            childAspectRatio: 0.73,
                          ),
                          delegate:
                              SliverChildBuilderDelegate((context, index) {
                            return Padding(
                              padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
                              child: XProductCardGrid(data: items[index]),
                            );
                          }, childCount: items.length),
                        );
                });
              })
            ],
          ));
    });
  }
}
