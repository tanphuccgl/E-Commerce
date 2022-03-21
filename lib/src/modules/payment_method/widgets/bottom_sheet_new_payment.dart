import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/config/themes/style.dart';
import 'package:e_commerce/src/modules/favorites/logic/favorites_bloc.dart';
import 'package:e_commerce/src/modules/payment_method/widgets/text_field_payment.dart';
import 'package:e_commerce/src/widgets/button/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class XBottomSheetNewPayment extends StatelessWidget {
  const XBottomSheetNewPayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var radius = const Radius.circular(34);
    return BlocBuilder<FavoriteBloc, FavoriteState>(builder: (context, state) {
      return Container(
        decoration: BoxDecoration(
            color: MyColors.colorBackground,
            borderRadius: BorderRadius.only(topLeft: radius, topRight: radius)),
        height: 500,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Add new card',
                  style: XStyle.textTheme().headlineSmall,
                ),
                const SizedBox(
                  height: 5,
                ),
                XTextFieldPayment(
                    onChanged: (value) {}, label: 'Name on card', value: ''),
                XTextFieldPayment(
                    onChanged: (value) {},
                    label: 'Card number',
                    value: '',
                    textInputType: TextInputType.number,
                    isShowTypeCard: true),
                XTextFieldPayment(
                    label: "Expire Date",
                    value: '',
                    readOnly: true,
                    textInputType: TextInputType.datetime,
                    onTap: () {},
                    onChanged: (value) {}),
                XTextFieldPayment(
                    onChanged: (value) {},
                    label: 'CVV',
                    value: '',
                    textInputType: TextInputType.number,
                    isShowHelp: true),
                Expanded(child: _setDefaultWidget()),
                const SizedBox(
                  height: 20,
                ),
                XButton(
                    label: 'ADD CARD',
                    height: 47,
                    width: double.infinity,
                    onPressed: () {}),
              ],
            ),
          ),
        ),
      );
    });
  }
}

Widget _setDefaultWidget() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Checkbox(
        value: true,
        activeColor: MyColors.colorBlack,
        onChanged: (value) {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
      ),
      const Text(
        'Set as default payment method',
        style: TextStyle(
            color: MyColors.colorBlack,
            height: 1,
            fontSize: 14,
            fontWeight: FontWeight.normal),
      )
    ],
  );
}
