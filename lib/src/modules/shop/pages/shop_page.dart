import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/modules/auth/widgets/app_bar_sign.dart';
import 'package:e_commerce/src/modules/shop/logic/categories_bloc.dart';
import 'package:e_commerce/src/modules/shop/widgets/category_listTile.dart';
import 'package:e_commerce/src/widgets/button/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sizeHeightBody = size.height -
        MediaQuery.of(context).padding.bottom -
        MediaQuery.of(context).padding.top;

    return BlocProvider(
      create: (_) => CategoriesBloc(),
      child: Scaffold(
        appBar: AppBarSign(
          elevation: 3,
          title: "Categories",
          style: const TextStyle(
              color: MyColors.colorBlack,
              fontSize: 18,
              height: 1.42,
              fontWeight: FontWeight.w600),
          backgroundColor: MyColors.colorBackground,
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              color: MyColors.colorBlack,
              onPressed: () {},
            )
          ],
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            height: sizeHeightBody,
            child: Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: XButton(
                            label: 'VIEW ALL ITEMS',
                            onPressed: () {},
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Text(
                          "Choose category",
                          style: TextStyle(
                              color: MyColors.colorGray,
                              fontSize: 14,
                              height: 1.42,
                              fontWeight: FontWeight.normal),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  const CategoryListTile()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
