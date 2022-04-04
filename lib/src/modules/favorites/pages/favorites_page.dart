import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/modules/favorites/logic/favorites_bloc.dart';
import 'package:e_commerce/src/modules/favorites/logic/paginate_favorites_bloc.dart';
import 'package:e_commerce/src/modules/favorites/router/favorites_router.dart';
import 'package:e_commerce/src/modules/favorites/widgets/product_card_horizontal.dart';
import 'package:e_commerce/src/modules/favorites/widgets/product_card_vertical.dart';
import 'package:e_commerce/src/utils/enum/page_info.dart';
import 'package:e_commerce/src/utils/enum/sort_by.dart';
import 'package:e_commerce/src/utils/enum/view_type.dart';
import 'package:e_commerce/src/widgets/bottom_sheet/bottom_sheet.dart';
import 'package:e_commerce/src/widgets/bottom_sheet/bottom_sheet_sort.dart';
import 'package:e_commerce/src/widgets/filter_bar/default_filter_bar.dart';
import 'package:e_commerce/src/widgets/header/header_delegate.dart';
import 'package:e_commerce/src/widgets/paginate/custom_paginate.dart';
import 'package:e_commerce/src/widgets/paginate/logic/paginate_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => PaginateFavoritesBloc(),
        child: BlocBuilder<PaginateFavoritesBloc, PaginateState>(
          builder: (context, paginateState) {
            return BlocBuilder<FavoriteBloc, FavoriteState>(
                builder: (context, state) {
              var items = (((paginateState.docs.data ?? [])
                  .map((e) => e as XProduct))).toList();
              state.sortBy.sortList(items: items);

              return Scaffold(
                  backgroundColor: state.viewType.backgroundColor(),
                  body: CustomPaginate(
                      paginate: paginateState.docs,
                      isLoadMore: false,
                      header: _header(context),
                      body: (state.viewType.index == 0
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
                                      child: XProductCardFavoriteHorizontal(
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
                                childAspectRatio: 164 / 280 + 0.1,
                              ),
                              delegate:
                                  SliverChildBuilderDelegate((context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(16, 10, 16, 0),
                                  child: XProductCardFavoriteVertical(
                                      data: items[index]),
                                );
                              }, childCount: items.length),
                            ))));
            });
          },
        ));
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
            title: 'Favorites',
            elevation: 3,
            isShowFilterBar: true,
            filterBarWidget: _filterBarWidget(),
            isShowTagChip: true,
            onPressedSearch: () =>
                FavoritesCoordinator.showSearchProductByFavorite(context),
            unSelectTagChip: true),
      ),
    );
  }

  Widget _filterBarWidget() {
    return BlocBuilder<FavoriteBloc, FavoriteState>(builder: (context, state) {
      return XDefaultFilerBar(
        iconViewType: state.viewType.iconOf(),
        onPressedSortBy: () => XBottomSheet.show(context,
            widget: XBottomSheetSort(
              pageInfo: PageInfo.favorites,
              sortBy: state.sortBy,
            )),
        onPressedViewType: () => context.read<FavoriteBloc>().changeViewType(),
        sortByText: state.sortBy.value(),
      );
    });
  }
}
