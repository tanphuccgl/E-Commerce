part of 'order_bloc.dart';

class OrderState extends Equatable {
  final XPaymentMethod paymentMethodData;
  final String trackingNumber;
  final String date;
  final String status;
  final XShippingAddress shippingAddressData;
  final String deliveryMethod;
  final XPromotion promotionData;
  final double total;
  final List<XProduct> listProducts;

  const OrderState(
      {required this.paymentMethodData,
      this.trackingNumber = '',
      this.date = '',
      this.status = '',
      required this.shippingAddressData,
      this.deliveryMethod = '',
      required this.promotionData,
      this.total = 0.0,
      required this.listProducts});

  @override
  List<Object?> get props => [
        paymentMethodData,
        trackingNumber,
        date,
        status,
        shippingAddressData,
        deliveryMethod,
        promotionData,
        total,
        listProducts,
      ];

  OrderState copyWith({
    XPaymentMethod? paymentMethodData,
    String? trackingNumber,
    String? date,
    String? status,
    XShippingAddress? shippingAddressData,
    String? deliveryMethod,
    XPromotion? promotionData,
    double? total,
    List<XProduct>? listProducts,
  }) {
    return OrderState(
      paymentMethodData: paymentMethodData ?? this.paymentMethodData,
      trackingNumber: trackingNumber ?? this.trackingNumber,
      date: date ?? this.date,
      status: status ?? this.status,
      shippingAddressData: shippingAddressData ?? this.shippingAddressData,
      deliveryMethod: deliveryMethod ?? this.deliveryMethod,
      promotionData: promotionData ?? this.promotionData,
      total: total ?? this.total,
      listProducts: listProducts ?? this.listProducts,
    );
  }
}
