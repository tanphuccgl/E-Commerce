import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/modules/home/logic/product_bloc.dart';
import 'package:e_commerce/src/widgets/card/product_card_gird.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RelatedProducts extends StatelessWidget {
  const RelatedProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
      var data = state.items ?? [];
      data.shuffle();
      return SizedBox(
        height: 294,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _header(),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, top: 10),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: XProductCardGrid(
                          data: data[index],
                        ),
                      );
                    },
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: 5),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _header() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text(
          'You can also like this',
          style: TextStyle(
              height: 1.42,
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: MyColors.colorBlack),
        ),
        Text('5 items',
            style: TextStyle(
                height: 1,
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: MyColors.colorGray))
      ],
    );
  }
}
