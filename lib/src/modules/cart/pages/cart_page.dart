import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/models/handle.dart';
import 'package:e_commerce/src/models/result.dart';
import 'package:e_commerce/src/modules/cart/logic/cart_bloc.dart';
import 'package:e_commerce/src/modules/cart/widgets/header_cart_delegate.dart';
import 'package:e_commerce/src/modules/cart/widgets/product_card_in_cart.dart';
import 'package:e_commerce/src/modules/cart/widgets/promo_code_widget.dart';
import 'package:e_commerce/src/utils/enum/sort_by.dart';
import 'package:e_commerce/src/utils/utils.dart';
import 'package:e_commerce/src/widgets/button/button_primary.dart';
import 'package:e_commerce/src/widgets/state/state_error_widget.dart';
import 'package:e_commerce/src/widgets/state/state_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BagPage extends StatelessWidget {
  const BagPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(builder: (context, state) {
      final items = state.productsOfCart.data ?? [];
      XHandle handle = XHandle.result(XResult.success(items));
      state.sortBy.sortList(items: items);
      if (handle.isCompleted) {
        return Scaffold(
            backgroundColor: MyColors.colorBackground,
            body: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                Theme(
                  data: ThemeData(
                    appBarTheme: const AppBarTheme(
                      iconTheme: IconThemeData(color: MyColors.colorBlack),
                    ),
                    textTheme: Theme.of(context).textTheme,
                  ),
                  child: const SliverPersistentHeader(
                    pinned: true,
                    floating: true,
                    delegate: HeaderCart(),
                  ),
                ),
                items.isEmpty
                    ? const SliverToBoxAdapter(
                        child: SizedBox(
                          height: 100,
                          child: Center(
                            child: Text(
                              'Empty List',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 20),
                            ),
                          ),
                        ),
                      )
                    : SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                            ),
                            child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 16),
                                child: XProductCardInCart(
                                  data: items[index],
                                )),
                          );
                        }, childCount: items.length),
                      ),
                SliverToBoxAdapter(
                    child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 25, 16, 28),
                  child: PromoCodeWidget(
                    onChanged: (value) {},
                    value: '',
                  ),
                )),
                SliverToBoxAdapter(
                    child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 26),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Total amount:',
                        style: TextStyle(
                            height: 1.42,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: MyColors.colorGray),
                      ),
                      Text(
                        "${XUtils.formatPrice(state.totalPrice(items))}\$",
                        style: const TextStyle(
                            height: 1.42,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: MyColors.colorBlack),
                      )
                    ],
                  ),
                )),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: XButton(
                      label: 'CHECK OUT',
                      height: 48,
                      width: 343,
                      onPressed: () {},
                    ),
                  ),
                )
              ],
            ));
      } else if (handle.isLoading) {
        return const XStateLoadingWidget();
      } else {
        return const XStateErrorWidget();
      }
    });
  }
}
