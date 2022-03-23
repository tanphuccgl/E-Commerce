import 'package:e_commerce/src/config/routes/coordinator.dart';
import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/config/themes/style.dart';
import 'package:e_commerce/src/modules/product/logic/list_products_filter_bloc.dart';
import 'package:e_commerce/src/utils/enum/sort_by.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class XBottomSheetSortDetailCategory extends StatelessWidget {
  const XBottomSheetSortDetailCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListProductsFilterBloc, ListProductsFilterState>(
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
                                .read<ListProductsFilterBloc>()
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
