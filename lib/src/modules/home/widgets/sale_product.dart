import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/modules/home/logic/product_bloc.dart';
import 'package:e_commerce/src/widgets/card/product_card_sale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SaleProduct extends StatelessWidget {
  const SaleProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
        

      final data = state.items ?? [];
      List<XProduct> items = data.where((e) => e.discount != 0).toList();
      return SizedBox(
        height: 337,
        width: double.infinity,
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
                      child: XProductCardSale(
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
                  'SALE',
                  style: TextStyle(
                      fontSize: 34,
                      height: 1,
                      color: MyColors.colorBlack,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Super summer sale',
                  style: TextStyle(
                      fontSize: 11,
                      height: 1,
                      color: MyColors.colorGray,
                      fontWeight: FontWeight.normal),
                )
              ],
            ),
            TextButton(
                onPressed: () {
                },
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
