import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/modules/auth/widgets/app_bar_sign.dart';
import 'package:e_commerce/src/modules/product_details/widgets/dropdown_color.dart';
import 'package:e_commerce/src/modules/product_details/widgets/dropdown_size.dart';
import 'package:e_commerce/src/modules/product_details/widgets/details.dart';
import 'package:e_commerce/src/modules/product_details/widgets/list_tile.dart';
import 'package:e_commerce/src/modules/product_details/widgets/related_products.dart';
import 'package:e_commerce/src/modules/product_details/widgets/top_images.dart';
import 'package:e_commerce/src/widgets/button/button_add_favorite.dart';
import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {
  final XProduct data;
  const ProductDetailsPage({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.colorBackground,
      appBar: AppBarSign(
        title: data.type,
        style: const TextStyle(
            color: MyColors.colorBlack,
            fontSize: 18,
            height: 1.42,
            fontWeight: FontWeight.w600),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.share))],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopImages(urlImage: data.image ?? 'N/A'),
            Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
                child: Column(
                  children: [
                    _topButton(),
                    const SizedBox(height: 20),
                    XDetails(data: data)
                  ],
                )),
            const ListTileDetailProduct(),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 12, 0, 30),
              child: RelatedProducts(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _topButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const XDropdownSize(),
        const XDropdownColor(),
        XButtonAddToFavorite(data: data),
      ],
    );
  }
}
