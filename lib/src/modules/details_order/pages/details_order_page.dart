import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/constants/my_images.dart';
import 'package:e_commerce/src/models/order_model.dart';
import 'package:e_commerce/src/modules/details_order/widgets/card_products_order.dart';
import 'package:e_commerce/src/utils/enum/extension.dart';
import 'package:e_commerce/src/utils/utils.dart';
import 'package:e_commerce/src/widgets/app_bar/default_app_bar.dart';
import 'package:e_commerce/src/widgets/button/button_primary.dart';
import 'package:flutter/material.dart';

class DetailsOrderPage extends StatelessWidget {
  const DetailsOrderPage({Key? key, required this.data}) : super(key: key);
  final XOrder data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: XDefaultAppBar(
        backgroundColor: MyColors.colorWhite,
        elevation: 1,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            color: MyColors.colorBlack,
            onPressed: () {},
          )
        ],
        title: 'Order Details',
        style: const TextStyle(
            color: MyColors.colorBlack,
            height: 1.42,
            fontWeight: FontWeight.w600,
            fontSize: 18),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Order No${data.id}',
                    style: const TextStyle(
                        height: 1,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: MyColors.colorBlack),
                  ),
                  Text(
                    data.date,
                    style: const TextStyle(
                        height: 1,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: MyColors.colorGray),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        text: 'Tracking number: ',
                        style: const TextStyle(
                            height: 1,
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: MyColors.colorGray),
                        children: <TextSpan>[
                          TextSpan(
                              text: data.trackingNumber,
                              style: const TextStyle(
                                  color: MyColors.colorBlack,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    data.status,
                    style: const TextStyle(
                        height: 1,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: MyColors.colorSuccess),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Text(
                '${data.listProducts.length} items',
                style: const TextStyle(
                    height: 1,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: MyColors.colorBlack),
              ),
              Column(
                children: data.listProducts
                    .map((e) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: XProductCardOrder(data: e)))
                    .toList(),
              ),
              const Text(
                'Order information',
                style: TextStyle(
                    height: 1,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: MyColors.colorBlack),
              ),
              const SizedBox(height: 15),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(
                    flex: 4,
                    child: Text(
                      'Tracking number:',
                      style: TextStyle(
                          height: 1,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: MyColors.colorGray),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Text(
                      '${data.shippingAddressData.address} ,${data.shippingAddressData.city} ,${data.shippingAddressData.province} ,${data.shippingAddressData.country}',
                      style: const TextStyle(
                        height: 1,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: MyColors.colorBlack,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Expanded(
                    flex: 4,
                    child: Text(
                      'Payment method:',
                      style: TextStyle(
                          height: 1,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: MyColors.colorGray),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        data.paymentMethodData.type == 0
                            ? _logoMaterCard()
                            : _logoVisa(),
                        const SizedBox(width: 10),
                        Text(
                            '**** **** **** ${data.paymentMethodData.cardNumber.toString().lastChars(4)}',
                            style: const TextStyle(
                              height: 1,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: MyColors.colorBlack,
                            ))
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 15),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(
                    flex: 4,
                    child: Text(
                      'Delivery method:',
                      style: TextStyle(
                          height: 1,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: MyColors.colorGray),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Text(
                      '${data.deliveryMethodData.name}, ${data.deliveryMethodData.shippingToDate} days, ${XUtils.formatPrice(data.deliveryMethodData.price)}\$',
                      style: const TextStyle(
                        height: 1,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: MyColors.colorBlack,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 15),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(
                    flex: 4,
                    child: Text(
                      'Discount:',
                      style: TextStyle(
                          height: 1,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: MyColors.colorGray),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Text(
                      data.promotionData.discount != 0.0
                          ? '${data.promotionData.discount}%, ${data.promotionData.name} code'
                          : '',
                      style: const TextStyle(
                        height: 1,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: MyColors.colorBlack,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 15),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(
                    flex: 4,
                    child: Text(
                      'Total Amount:',
                      style: TextStyle(
                          height: 1,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: MyColors.colorGray),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Text(
                      '${data.total}\$',
                      style: const TextStyle(
                        height: 1,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: MyColors.colorBlack,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buttonReorder(context),
                  XButton(
                    label: 'Leave feedback',
                    height: 36,
                    width: 150,
                    onPressed: () {},
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buttonReorder(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 36,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            onPrimary: MyColors.colorPrimary,
            shadowColor: MyColors.colorWhite.withOpacity(0.7),
            primary: MyColors.colorWhite),
        onPressed: () => {},
        child: const Text('Reorder',
            textAlign: TextAlign.center,
            style: TextStyle(
                height: 1,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: MyColors.colorBlack)),
      ),
    );
  }

  Widget _logoMaterCard() {
    return SizedBox(
        height: 38,
        child: Center(
          child: Image.asset(MyImages.masterCardPayment, fit: BoxFit.cover),
        ));
  }

  Widget _logoVisa() {
    return SizedBox(
        height: 38,
        child: Center(
          child: Image.asset(MyImages.visaCardPayment,
              color: Colors.blue, fit: BoxFit.cover),
        ));
  }
}
