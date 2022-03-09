import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/modules/auth/widgets/app_bar_sign.dart';
import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {
  final XProduct data;
  const ProductDetailsPage({Key? key,required this.data }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSign(),
      body: Container(),
    );
  }
}
