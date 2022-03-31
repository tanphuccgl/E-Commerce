import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/modules/detail_category/widgets/product_card_horizontal.dart';
import 'package:e_commerce/src/modules/product_details/widgets/product_card_vertical.dart';
import 'package:e_commerce/src/modules/view_all_products/logic/view_all_products_bloc.dart';
import 'package:e_commerce/src/utils/enum/page_info.dart';
import 'package:e_commerce/src/utils/enum/product_type.dart';
import 'package:e_commerce/src/utils/enum/sort_by.dart';
import 'package:e_commerce/src/utils/enum/view_type.dart';
import 'package:e_commerce/src/widgets/bottom_sheet/bottom_sheet.dart';
import 'package:e_commerce/src/widgets/bottom_sheet/bottom_sheet_sort.dart';
import 'package:e_commerce/src/widgets/filter_bar/default_filter_bar.dart';
import 'package:e_commerce/src/widgets/header/header_delegate.dart';
import 'package:e_commerce/src/widgets/paginate/paginate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewAllProductsPage extends StatelessWidget {
  final ProductType productType;

  const ViewAllProductsPage({Key? key, required this.productType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewAllProductsBloc, ViewAllProductsState>(
        builder: (context, state) {
      final items = state.listProducts.data ?? [];
      state.sortBy.sortList(items: items);
      return Scaffold(
          backgroundColor: state.viewType.backgroundColor(),
          body: Paginate(
            restart: () => context.read<ViewAllProductsBloc>().restart(),
            fetchData: () => context
                .read<ViewAllProductsBloc>()
                .getProductViewAll(productType: productType),
            fetchNextData: () => items.length <= 5 && items.isNotEmpty
                ? null
                : context
                    .read<ViewAllProductsBloc>()
                    .loadMore(productType: productType),
            reloadData: () => context
                .read<ViewAllProductsBloc>()
                .refresh(productType: productType),
            header: _header(context),
            isLoadMore: state.isLoadMore,
            isEndList:
                items.length <= 5 && items.isNotEmpty ? true : state.isEndList,
            handle: state.docs,
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

  Widget _filterBarWidget() {
    return BlocBuilder<ViewAllProductsBloc, ViewAllProductsState>(
        builder: (context, state) {
      return XDefaultFilerBar(
        iconViewType: state.viewType.iconOf(),
        onPressedSortBy: () => XBottomSheet.show(context,
            widget: XBottomSheetSort(
              pageInfo: PageInfo.home,
              sortBy: state.sortBy,
            )),
        onPressedViewType: () =>
            context.read<ViewAllProductsBloc>().changeViewType(),
        sortByText: state.sortBy.value(),
      );
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
            title: productType.title(),
            elevation: 3,
            filterBarWidget: _filterBarWidget(),
            isShowFilterBar: true,
            onPressedSearch: () {}),
      ),
    );
  }
}
