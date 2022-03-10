import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/models/handle.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/models/result.dart';
import 'package:e_commerce/src/modules/product/logic/product_bloc.dart';
import 'package:e_commerce/src/widgets/card/product_card_new.dart';
import 'package:e_commerce/src/widgets/state/state_error_widget.dart';
import 'package:e_commerce/src/widgets/state/state_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewProduct extends StatelessWidget {
  const NewProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
      final data = state.items.data ?? [];
      List<XProduct> items = data.where((e) => e.newProduct == true).toList();
      XHandle handle = XHandle.result(XResult.success(items));
      if (handle.isCompleted) {
        return SizedBox(
          height: 337,
          child: Column(
            children: [
              _header(),
              const SizedBox(
                height: 22,
              ),
              Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: XProductCardNew(
                          data: items[index],
                        ),
                      );
                    },
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: items.length),
              ),
            ],
          ),
        );
      } else if (handle.isLoading) {
        return const XStateLoadingWidget();
      } else {
        return const XStateErrorWidget();
      }
    });
  }

  Widget _header() {
    return SizedBox(
        height: 49,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'NEW',
                  style: TextStyle(
                      fontSize: 34,
                      height: 1,
                      color: MyColors.colorBlack,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'You’ve never seen it before!',
                  style: TextStyle(
                      fontSize: 11,
                      height: 1,
                      color: MyColors.colorGray,
                      fontWeight: FontWeight.normal),
                )
              ],
            ),
            TextButton(
                onPressed: () {},
                child: const Text(
                  "View all",
                  style: TextStyle(
                      color: MyColors.colorBlack,
                      fontSize: 11,
                      height: 1,
                      fontWeight: FontWeight.normal),
                ))
          ],
        ));
  }
}
