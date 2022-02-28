import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/modules/auth/widgets/app_bar_sign.dart';
import 'package:e_commerce/src/modules/home/logic/product_bloc.dart';
import 'package:e_commerce/src/modules/tops/widgets/filter_bar.dart';
import 'package:e_commerce/src/modules/tops/widgets/list_of_product.dart';

import 'package:e_commerce/src/widgets/chip/tag_chip.dart';
import 'package:e_commerce/src/widgets/header/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopsPage extends StatelessWidget {
  const TopsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductBloc(),
      child: Scaffold(
        backgroundColor: MyColors.colorWhite,
        appBar: AppBarSign(actions: [
          IconButton(
            icon: const Icon(Icons.search),
            color: MyColors.colorBlack,
            onPressed: () {},
          )
        ]),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 14),
              child: Column(
                children: [
                  const XHeader(
                    title: 'Women\'t tops',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 40,
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: const [
                        TagChip(label: "T-shirts"),
                        TagChip(label: "Crop tops"),
                        TagChip(label: "Sleeveless"),
                        TagChip(label: "Shirts"),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 14, top: 15, left: 14),
                    child: FilerBar(),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: Container(
              color: MyColors.colorBackground2,
              child: const XListOfProduct(),
            ))
          ],
        ),
      ),
    );
  }
}
