import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/modules/product_details/widgets/dropdown_color.dart';
import 'package:e_commerce/src/modules/product_details/widgets/dropdown_size.dart';
import 'package:e_commerce/src/modules/product_details/widgets/details.dart';
import 'package:e_commerce/src/modules/product_details/widgets/list_tile.dart';
import 'package:e_commerce/src/modules/product_details/widgets/related_products.dart';
import 'package:e_commerce/src/modules/product_details/widgets/top_images.dart';
import 'package:e_commerce/src/widgets/app_bar/default_app_bar.dart';
import 'package:e_commerce/src/widgets/button/button_add_favorite.dart';
import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {
  final XProduct? data;
  final String id;
  const ProductDetailsPage({
    @PathParam('id') required this.id,
    Key? key,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var value = data ?? XProduct();
    return Scaffold(
      backgroundColor: MyColors.colorBackground,
      appBar: XDefaultAppBar(
        title: value.type,
        style: const TextStyle(
            color: MyColors.colorBlack,
            fontSize: 18,
            height: 1.42,
            fontWeight: FontWeight.w600),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.share))],
      ),
      body: ListView(
        children: [
          TopImages(urlImage: value.image ?? 'N/A'),
          Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
              child: Column(
                children: [
                  _topButton(),
                  const SizedBox(height: 20),
                  XDetails(data: data ?? XProduct())
                ],
              )),
          const ListTileDetailProduct(),
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 12, 0, 30),
            child: RelatedProducts(),
          ),
        ],
      ),
    );
  }

  Widget _topButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const XDropdownSize(),
        const XDropdownColor(),
        XButtonAddToFavorite(data: data ?? XProduct()),
      ],
    );
  }
}
