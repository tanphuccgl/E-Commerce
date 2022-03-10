import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/models/handle.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/models/result.dart';
import 'package:e_commerce/src/modules/detail_category/widgets/header_detail_category_delegate.dart';
import 'package:e_commerce/src/modules/detail_category/widgets/product_card_horizontal.dart';
import 'package:e_commerce/src/modules/product/logic/product_bloc.dart';
import 'package:e_commerce/src/utils/enum/sort_by.dart';
import 'package:e_commerce/src/utils/enum/view_type.dart';
import 'package:e_commerce/src/widgets/card/product_card_vertical.dart';
import 'package:e_commerce/src/widgets/state/state_error_widget.dart';
import 'package:e_commerce/src/widgets/state/state_loading_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailCategoryPage extends StatelessWidget {
  final String idCategory;
  final String nameCategory;
  const DetailCategoryPage(
      {Key? key, required this.idCategory, required this.nameCategory})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
      return Scaffold(
          backgroundColor: state.viewType.backgroundColor(),
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
                final data = state.items.data ?? [];
                List<XProduct> items =
                    data.where((e) => e.idCategory == idCategory).toList();
                state.sortBy.sortList(items: items);
                XHandle handle = XHandle.result(XResult.success(items));
                if (handle.isCompleted) {
                  return state.viewType.index == 0
                      ? SliverList(
                          delegate:
                              SliverChildBuilderDelegate((context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 10),
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
                                  childAspectRatio: 0.73),
                          delegate:
                              SliverChildBuilderDelegate((context, index) {
                            return Padding(
                              padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
                              child: XProductCardVertical(data: items[index]),
                            );
                          }, childCount: items.length),
                        );
                } else if (handle.isLoading) {
                  return const XStateLoadingWidget();
                } else {
                  return const XStateErrorWidget();
                }
              })
            ],
          ));
    });
  }
}
