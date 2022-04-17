import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/models/delivery_method_model.dart';
import 'package:e_commerce/src/modules/account/logic/account_bloc.dart';
import 'package:e_commerce/src/modules/cart/logic/cart_bloc.dart';
import 'package:e_commerce/src/modules/checkout/widgets/sums_widget.dart';
import 'package:e_commerce/src/modules/delivery/logic/delivery_bloc.dart';
import 'package:e_commerce/src/modules/delivery/widgets/delivery_method_widget.dart';
import 'package:e_commerce/src/modules/order/logic/order_bloc.dart';
import 'package:e_commerce/src/modules/payment_method/widgets/payment_widget.dart';
import 'package:e_commerce/src/modules/shipping_address/shipping_addresses/widgets/shipping_address_widget.dart';
import 'package:e_commerce/src/widgets/app_bar/default_app_bar.dart';
import 'package:e_commerce/src/widgets/button/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const XDefaultAppBar(
        backgroundColor: MyColors.colorWhite,
        elevation: 1,
        title: 'Checkout',
        style: TextStyle(
            color: MyColors.colorBlack,
            height: 1.42,
            fontWeight: FontWeight.w600,
            fontSize: 18),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const ShippingAddressWidget(),
              const SizedBox(
                height: 30,
              ),
              const PaymentWidget(),
              const SizedBox(
                height: 30,
              ),
              const DeliveryMethodWidget(),
              const SizedBox(
                height: 30,
              ),
              const SumsWidget(),
              const SizedBox(
                height: 10,
              ),
              BlocBuilder<AccountBloc, AccountState>(
                builder: (context, state) {
                  return BlocBuilder<CartBloc, CartState>(
                    builder: (context, cartState) {
                      final items = cartState.productsOfCart.data ?? [];

                      return BlocBuilder<OrderBloc, OrderState>(
                        builder: (context, orderState) {
                          return BlocBuilder<DeliveryBloc, DeliveryState>(
                            builder: (context, deliveryState) {
                              return XButton(
                                label: 'SUBMIT ORDER',
                                height: 48,
                                width: 343,
                                onPressed: state.paymentMethodDefault.id != 'N/A' &&
                                        state.shippingAddressDefault.id !=
                                            'N/A' &&
                                        deliveryState.deliveryMethodData !=
                                            null &&
                                        (deliveryState.deliveryMethodData ??
                                                    XDeliveryMethod())
                                                .id !=
                                            ''
                                    ? () => context.read<OrderBloc>().submitOrder(
                                        context,
                                        deliveryMethod:
                                            deliveryState.deliveryMethodData ??
                                                XDeliveryMethod(),
                                        paymentMethod:
                                            state.paymentMethodDefault,
                                        shippingAddress:
                                            state.shippingAddressDefault,
                                        listProducts: items,
                                        total: cartState.totalPrice(
                                                promoCode: orderState.promotionData.discount) +
                                            15.0)
                                    : null,
                              );
                            },
                          );
                        },
                      );
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
