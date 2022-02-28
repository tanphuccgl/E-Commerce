
import 'package:e_commerce/src/modules/home/logic/product_bloc.dart';
import 'package:e_commerce/src/widgets/card/product_card_horizontal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class XListOfProduct extends StatelessWidget {
  const XListOfProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
      var items = state.items ?? [];
      return state.isLoading == false
          ? ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: XProductCardHorizontal(data: items[index]));
              },
              itemCount: items.length,
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            )
          : const Center(child: CircularProgressIndicator());
    });
  }
}
