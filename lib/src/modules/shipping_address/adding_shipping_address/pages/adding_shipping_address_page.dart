import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/config/themes/style.dart';
import 'package:e_commerce/src/modules/shipping_address/adding_shipping_address/widgets/alert_dialog_country.dart';
import 'package:e_commerce/src/modules/shipping_address/adding_shipping_address/widgets/text_field_shipping_address.dart';
import 'package:e_commerce/src/widgets/app_bar/default_app_bar.dart';
import 'package:e_commerce/src/widgets/button/button_primary.dart';
import 'package:flutter/material.dart';

class AddShippingAddressPage extends StatelessWidget {
  const AddShippingAddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: XDefaultAppBar(
          backgroundColor: MyColors.colorBackground,
          elevation: 1,
          title: 'Adding Shipping Address',
          style: XStyle.textTheme().headlineSmall),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(17, 35, 12, 0),
          child: Column(
            children: [
              XTextFieldShippingAddress(
                label: 'Full name',
                onChanged: (value) {},
                textInputType: TextInputType.name,
                errorText: '',
                value: '',
              ),
              XTextFieldShippingAddress(
                label: 'Address',
                onChanged: (value) {},
                textInputType: TextInputType.streetAddress,
                errorText: '',
                value: '',
              ),
              XTextFieldShippingAddress(
                label: 'City',
                onChanged: (value) {},
                errorText: '',
                value: '',
              ),
              XTextFieldShippingAddress(
                label: 'State/Province/Region',
                onChanged: (value) {},
                errorText: '',
                value: '',
              ),
              XTextFieldShippingAddress(
                label: 'Zip Code (Postal Code)',
                onChanged: (value) {},
                textInputType: TextInputType.number,
                errorText: '',
                value: '',
              ),
              XTextFieldShippingAddress(
                label: 'Country',
                onChanged: (value) {},
                errorText: '',
                value: '',
                readOnly: true,
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => alertDialogCountry(context));
                },
                isShowPopUp: true,
              ),
              XButton(
                label: 'SAVE ADDRESS',
                height: 48,
                onPressed: () {},
                width: double.infinity,
              )
            ],
          ),
        ),
      ),
    );
  }
}
