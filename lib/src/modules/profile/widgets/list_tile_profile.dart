import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/modules/account/logic/account_bloc.dart';
import 'package:e_commerce/src/modules/dashboard/router/dashboard_router.dart';
import 'package:e_commerce/src/modules/order/logic/order_bloc.dart';
import 'package:e_commerce/src/modules/order/router/order_router.dart';
import 'package:e_commerce/src/modules/profile/router/profile_router.dart';
import 'package:e_commerce/src/utils/enum/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class XFunctionProfile {
  final String title;
  final String subtitle;
  final Function()? onTap;

  XFunctionProfile(
      {required this.title, required this.subtitle, required this.onTap});
}

class ListTileProfile extends StatelessWidget {
  const ListTileProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = size.width * 0.037;
    final paddingContent = EdgeInsets.fromLTRB(padding, 0, padding, 0);

    return BlocBuilder<AccountBloc, AccountState>(
      builder: (context, state) {
        return BlocBuilder<OrderBloc, OrderState>(
          builder: (context, orderState) {
            final String subtitlePayment;
            if (state.paymentMethodDefault.id != 'N/A') {
              subtitlePayment =
                  '${state.paymentMethodDefault.type == 1 ? "Mater Card" : 'Visa'} **${state.paymentMethodDefault.cardNumber.toString().lastChars(2)}';
            } else {
              subtitlePayment = 'No card';
            }
            final List<XFunctionProfile> _items = [
              XFunctionProfile(
                  subtitle:
                      'Already have ${orderState.listOrder.length} orders',
                  title: 'My orders',
                  onTap: () => OrderCoordinator.showMyOrder(context)),
              XFunctionProfile(
                  subtitle:
                      '${(state.data.shippingAddresses ?? []).length} addresses',
                  title: 'Shipping addresses',
                  onTap: () =>
                      DashboardCoordinator.showShippingAddresses(context)),
              XFunctionProfile(
                  subtitle: subtitlePayment,
                  title: 'Payment methods',
                  onTap: () => DashboardCoordinator.showPaymentMethod(context)),
              XFunctionProfile(
                  subtitle: 'You have special promocodes',
                  title: 'Promocodes',
                  onTap: () {}),
              XFunctionProfile(
                  subtitle: 'Reviews for 4 items',
                  title: 'My reviews',
                  onTap: () {}),
              XFunctionProfile(
                  subtitle: 'Infomation, password',
                  title: 'Settings',
                  onTap: () => ProfileCoordinator.showSetting(context)),
              XFunctionProfile(
                  subtitle: 'List Notifications',
                  title: 'Notification',
                  onTap: () => ProfileCoordinator.showNotification(context)),
              XFunctionProfile(
                  subtitle: 'Log out account',
                  title: 'Logout',
                  onTap: () => context.read<AccountBloc>().logout(context)),
            ];
            return Column(
                children: ListTile.divideTiles(
                    color: MyColors.colorGray,
                    tiles: _items.map((item) => ListTile(
                          dense: true,
                          contentPadding: paddingContent,
                          onTap: () => item.onTap!(),
                          title: Text(item.title,
                              style: const TextStyle(
                                  fontSize: 16,
                                  height: 1,
                                  color: MyColors.colorBlack,
                                  fontWeight: FontWeight.w600)),
                          subtitle: Text(item.subtitle,
                              style: const TextStyle(
                                  fontSize: 11,
                                  height: 1,
                                  color: MyColors.colorGray,
                                  fontWeight: FontWeight.normal)),
                          trailing: const Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: MyColors.colorGray,
                          ),
                        ))).toList());
          },
        );
      },
    );
  }
}
