import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/modules/cart/logic/cart_bloc.dart';
import 'package:e_commerce/src/modules/promotion/logic/promotion_bloc.dart';
import 'package:e_commerce/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SumsWidget extends StatelessWidget {
  const SumsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _orderWidget(),
        const SizedBox(
          height: 14,
        ),
        _deliveryWidget(),
        const SizedBox(
          height: 14,
        ),
        _summaryWidget()
      ],
    );
  }
}

Widget _orderWidget() {
  return BlocBuilder<PromotionBloc, PromotionState>(builder: (context, state1) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Order:',
              style: TextStyle(
                  color: MyColors.colorGray,
                  height: 1.42,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              "${XUtils.formatPrice(state.totalPrice(items: state.productsOfCart.data ?? [], promoCode: state1.discountPromotion))}\$",
              style: _priceStyle(),
            )
          ],
        );
      },
    );
  });
}

Widget _deliveryWidget() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const Text(
        'Delivery:',
        style: TextStyle(
            color: MyColors.colorGray,
            height: 1.42,
            fontSize: 14,
            fontWeight: FontWeight.w500),
      ),
      Text(
        '15\$',
        style: _priceStyle(),
      )
    ],
  );
}

Widget _summaryWidget() {
  return BlocBuilder<PromotionBloc, PromotionState>(builder: (context, state1) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Summary:',
              style: TextStyle(
                  color: MyColors.colorGray,
                  height: 1,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              "${XUtils.formatPrice(state.totalPrice(items: state.productsOfCart.data ?? [], promoCode: state1.discountPromotion) + 15.0)}\$",
              style: _priceStyle(),
            )
          ],
        );
      },
    );
  });
}

TextStyle _priceStyle() {
  return const TextStyle(
      color: MyColors.colorBlack,
      height: 1,
      fontSize: 16,
      fontWeight: FontWeight.w600);
}
