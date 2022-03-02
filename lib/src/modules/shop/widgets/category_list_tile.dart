import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/models/categories_model.dart';
import 'package:e_commerce/src/modules/dashboard/router/dashboard_router.dart';
import 'package:e_commerce/src/modules/shop/logic/categories_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryListTile extends StatelessWidget {
  const CategoryListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesBloc, CategoriesState>(
        builder: (context, state) {
      List<XCategories> items = state.items ?? [];

      return Column(
          children: ListTile.divideTiles(
              color: MyColors.colorGray,
              tiles: items.map((item) => ListTile(
                    dense: true,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 40),
                    onTap: () => DashboardCoordinator.showProductByCategory(context,
                        idCategory: item.id, nameCategory: item.name ?? 'N/A'),
                    title: Text(item.name ?? "N/A",
                        style: const TextStyle(
                            fontSize: 16,
                            height: 1,
                            color: MyColors.colorBlack,
                            fontWeight: FontWeight.normal)),
                  ))).toList());
    });
  }
}
