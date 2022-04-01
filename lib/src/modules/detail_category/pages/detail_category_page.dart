import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/modules/detail_category/widgets/product_card_horizontal.dart';
import 'package:e_commerce/src/modules/product/logic/list_products_filter_bloc.dart';
import 'package:e_commerce/src/modules/product_details/widgets/product_card_vertical.dart';
import 'package:e_commerce/src/modules/shop/router/shop_router.dart';
import 'package:e_commerce/src/modules/view_all_products/logic/view_all_products_bloc.dart';
import 'package:e_commerce/src/utils/enum/page_info.dart';
import 'package:e_commerce/src/utils/enum/product_type.dart';
import 'package:e_commerce/src/utils/enum/sort_by.dart';
import 'package:e_commerce/src/utils/enum/view_type.dart';
import 'package:e_commerce/src/widgets/bottom_sheet/bottom_sheet.dart';
import 'package:e_commerce/src/widgets/bottom_sheet/bottom_sheet_sort.dart';
import 'package:e_commerce/src/widgets/filter_bar/default_filter_bar.dart';
import 'package:e_commerce/src/widgets/header/header_delegate.dart';
import 'package:e_commerce/src/widgets/paginate/custom_paginate.dart';
import 'package:e_commerce/src/widgets/paginate/paginate.dart';
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
    //ProductType productType = convertStringToProductType(nameCategory);
    return BlocBuilder<ViewAllProductsBloc, ViewAllProductsState>(
        builder: (context, state) {
      final items = state.listProducts.data ?? [];
      state.sortBy.sortList(items: items);
      return Scaffold(
          backgroundColor: state.viewType.backgroundColor(),
          body: CustomPaginate(
            paginate: XPaginate.initial(),
            header: _header(context),
            isLoadMore: true,
            body: state.viewType.index == 0
                ? SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            child: XProductCardHorizontal(data: items[index])),
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
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
                        child: XProductCardVertical(data: items[index]),
                      );
                    }, childCount: items.length),
                  ),
          ));
    });
  }

  Widget _header(BuildContext context) {
    return Theme(
      data: ThemeData(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: MyColors.colorBlack),
        ),
        textTheme: Theme.of(context).textTheme,
      ),
      child: SliverPersistentHeader(
        pinned: true,
        floating: true,
        delegate: XHeaderDelegate(
            title: nameCategory,
            isShowTagChip: true,
            elevation: 3,
            isShowFilterBar: true,
            onPressedSearch: () =>
                ShopCoordinator.showSearchProductByCategory(context),
            filterBarWidget: _filterBarWidget()),
      ),
    );
  }

  Widget _filterBarWidget() {
    return BlocBuilder<ListProductsFilterBloc, ListProductsFilterState>(
        builder: (context, state) {
      return XDefaultFilerBar(
        iconViewType: state.viewType.iconOf(),
        onPressedSortBy: () => XBottomSheet.show(context,
            widget: XBottomSheetSort(
              sortBy: state.sortBy,
              pageInfo: PageInfo.detailsCategory,
            )),
        onPressedViewType: () =>
            context.read<ListProductsFilterBloc>().changeViewType(),
        sortByText: state.sortBy.value(),
      );
    });
  }

  ProductType convertStringToProductType(String nameProduct) {
    switch (nameProduct) {
      case "Tops":
        return ProductType.top;

      case "Shirts & Blouses":
        return ProductType.shirts;
      case "Cardigans & Sweaters":
        return ProductType.cardigans;
      case "Knitwear":
        return ProductType.knitwear;
      case "Blazers":
        return ProductType.blazers;
      case "Outerwear":
        return ProductType.outerwear;
      case "Pants":
        return ProductType.pants;
      case "Jeans":
        return ProductType.jeans;
      case "Shorts":
        return ProductType.shorts;
      case "Skirts":
        return ProductType.skirts;
      case "Dresses":
        return ProductType.dresses;

      default:
        return ProductType.dresses;
    }
  }
}
