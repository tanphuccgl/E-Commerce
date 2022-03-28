import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/models/handle.dart';
import 'package:e_commerce/src/models/result.dart';
import 'package:e_commerce/src/modules/cart/logic/cart_bloc.dart';
import 'package:e_commerce/src/modules/cart/router/cart_router.dart';
import 'package:e_commerce/src/modules/cart/widgets/product_card_in_cart.dart';
import 'package:e_commerce/src/modules/cart/widgets/promo_code_widget.dart';
import 'package:e_commerce/src/modules/promotion/logic/promotion_bloc.dart';
import 'package:e_commerce/src/modules/promotion/widgets/bottom_sheet_promotion.dart';
import 'package:e_commerce/src/utils/enum/sort_by.dart';
import 'package:e_commerce/src/utils/utils.dart';
import 'package:e_commerce/src/widgets/bottom_sheet/bottom_sheet.dart';
import 'package:e_commerce/src/widgets/button/button_primary.dart';
import 'package:e_commerce/src/widgets/header/header_delegate.dart';
import 'package:e_commerce/src/widgets/paginate/paginate.dart';
import 'package:e_commerce/src/widgets/state/state_error_widget.dart';
import 'package:e_commerce/src/widgets/state/state_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(builder: (context, state) {
      final items = state.productsOfCart.data ?? [];
      XHandle handle = XHandle.result(XResult.success(items));
      state.sortBy.sortList(items: items);
      if (handle.isCompleted) {
        return Scaffold(
            backgroundColor: MyColors.colorBackground,
//TODO
            body: Paginate(
                list: items,
                header: _header(context),
                footer: _footer(context),
                body: SliverList(
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
                fetchNextData: () {
                  context.read<CartBloc>().getProduct();
                }));
      } else if (handle.isLoading) {
        return const XStateLoadingWidget();
      } else {
        return const XStateErrorWidget();
      }
    });
  }

  Widget _header(BuildContext context) {
    return Theme(
      data: ThemeData(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: MyColors.colorBlack),
        ),
        textTheme: Theme.of(context).textTheme,
      ),
      child: const SliverPersistentHeader(
        pinned: true,
        floating: true,
        delegate: XHeaderDelegate(
            title: 'My Bag', backgroundColor: MyColors.colorBackground),
      ),
    );
  }

  Widget _footer(BuildContext context) {
    return SliverToBoxAdapter(
        child: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
      return BlocBuilder<PromotionBloc, PromotionState>(
          builder: (context, promotionState) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: PromoCodeWidget(
                  onChanged: (value) =>
                      context.read<PromotionBloc>().changedPromoCode(value),
                  onPressedArrowIcon: () => XBottomSheet.show(context,
                      backgroundColor: MyColors.colorBackground,
                      widget: const XBottomSheetPromotion()),
                  value: promotionState.promoCode,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 26),
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
                      "${XUtils.formatPrice(state.totalPrice(promoCode: promotionState.discountPromotion))}\$",
                      style: const TextStyle(
                          height: 1.42,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: MyColors.colorBlack),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: XButton(
                  label: 'CHECK OUT',
                  height: 48,
                  width: 343,
                  onPressed: () => CartCoordinator.showCheckoutScreen(context),
                ),
              ),
            ],
          ),
        );
      });
    }));
  }
}
