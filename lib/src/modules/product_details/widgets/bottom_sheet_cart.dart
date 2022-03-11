import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/config/themes/style.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/modules/cart/logic/cart_bloc.dart';
import 'package:e_commerce/src/utils/enum/size_type.dart';
import 'package:e_commerce/src/widgets/button/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class XBottomSheetCart extends StatelessWidget {
  final XProduct data;
  const XBottomSheetCart({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(builder: (context, state) {
      return SizedBox(
        height: 300,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Select size',
                  style: XStyle.textTheme().headlineSmall,
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: SizedBox(
                    height: 100,
                    child: GridView.count(
                      crossAxisCount: 3,
                      shrinkWrap: true,
                      childAspectRatio: 100 / 40,
                      crossAxisSpacing: 22,
                      mainAxisSpacing: 16,
                      children: SizeType.values
                          .map((e) => _boxSize(
                              sizeType: e,
                              onPressed: () => context
                                  .read<CartBloc>()
                                  .onSelectSize(e.index)))
                          .toList(),
                    ),
                  ),
                ),
                ListTile(
                  title: const Text(
                    'Size info',
                    style: TextStyle(
                        color: MyColors.colorBlack,
                        height: 1,
                        fontSize: 16,
                        fontWeight: FontWeight.normal),
                  ),
                  onTap: () {},
                  trailing: const Icon(Icons.keyboard_arrow_right),
                ),
                const SizedBox(
                  height: 5,
                ),
                XButton(
                    label: 'ADD TO CART',
                    height: 47,
                    width: double.infinity,
                    onPressed: state.hadFavorites(data)
                        ? null
                        : () {
                            context.read<CartBloc>().addToCart(context,
                                product: data, sizeType: state.sizeType);
                          })
              ],
            ),
          ),
        ),
      );
    });
  }
}

Widget _boxSize({required SizeType sizeType, required Function() onPressed}) {
  return BlocBuilder<CartBloc, CartState>(builder: (context, state) {
    return SizedBox(
      height: 40,
      width: 100,
      child: ElevatedButton(
        onPressed: onPressed,
        style: state.sizeType
            .styleElevatedOf(sizeType.selectedSize(state.sizeType)),
        child: Center(
          child: Text(sizeType.value(),
              textAlign: TextAlign.center,
              style: state.sizeType
                  .styleOf(sizeType.selectedSize(state.sizeType))),
        ),
      ),
    );
  });
}
