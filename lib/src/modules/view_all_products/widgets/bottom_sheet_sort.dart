import 'package:e_commerce/src/config/routes/coordinator.dart';
import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/config/themes/style.dart';
import 'package:e_commerce/src/modules/view_all_products/logic/view_all_products_bloc.dart';
import 'package:e_commerce/src/utils/enum/sort_by.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class XBottomSheetSortViewAllProducts extends StatelessWidget {
  const XBottomSheetSortViewAllProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewAllProductsBloc, ViewAllProductsState>(
      builder: (context, state) {
        return SizedBox(
          height: 300,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Sort by',
                  style: XStyle.textTheme().headlineSmall,
                ),
                const SizedBox(
                  height: 5,
                ),
                Column(
                  children: ListTile.divideTiles(
                      color: MyColors.colorWhite,
                      tiles: SortBy.values.map((item) {
                        return ListTile(
                          dense: true,
                          selectedColor: MyColors.colorPrimary,
                          selectedTileColor: MyColors.colorPrimary,
                          selected: item.sortProductBy(state.sortBy),
                          onTap: () {
                            context
                                .read<ViewAllProductsBloc>()
                                .sortBy(item.index);
                            XCoordinator.pop(context);
                          },
                          title: Text(item.value(),
                              style: state.sortBy
                                  .styleOf(item.sortProductBy(state.sortBy))),
                        );
                      })).toList(),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
