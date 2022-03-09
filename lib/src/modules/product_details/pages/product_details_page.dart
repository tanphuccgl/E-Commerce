import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/modules/auth/widgets/app_bar_sign.dart';
import 'package:e_commerce/src/modules/product_details/widgets/top_images.dart';
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
          children: [TopImages(urlImage: data.image ?? 'N/A')],
        ),
      ),
    );
  }
}
