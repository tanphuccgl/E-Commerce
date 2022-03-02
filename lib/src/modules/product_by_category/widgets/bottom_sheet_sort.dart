import 'package:e_commerce/src/config/routes/coordinator.dart';
import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/config/themes/style.dart';
import 'package:e_commerce/src/modules/product_by_category/logic/product_by_category_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class XBottomSheetSort extends StatelessWidget {
  const XBottomSheetSort({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> list = [
      "Popular",
      'Newest',
      'Customer review',
      'Price: lowest to high',
      'Price: highest to low'
    ];
    return BlocBuilder<ProductByCategoryBloc, ProductByCategoryState>(
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
                      tiles: list.map((item) => ListTile(
                            dense: true,
                            selectedColor: MyColors.colorPrimary,
                            selectedTileColor: MyColors.colorWhite,
                            selected: true,
                            onTap: () {
                              context
                                  .read<ProductByCategoryBloc>()
                                  .sortBy(label: item);
                              XCoordinator.pop(context);
                            },
                            title: Text(item,
                                style: const TextStyle(
                                    fontSize: 16,
                                    height: 1,
                                    color: MyColors.colorBlack,
                                    fontWeight: FontWeight.normal)),
                          ))).toList(),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
