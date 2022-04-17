part of 'delivery_bloc.dart';

class DeliveryState extends Equatable {
  final List<XDeliveryMethod> items;
  final XDeliveryMethod? deliveryMethodData;
  const DeliveryState({required this.items, this.deliveryMethodData});
  @override
  List<Object?> get props => [items, deliveryMethodData];

  DeliveryState copyWith({
    List<XDeliveryMethod>? items,
    XDeliveryMethod? deliveryMethodData,
  }) {
    return DeliveryState(
        items: items ?? this.items,
        deliveryMethodData: deliveryMethodData ?? this.deliveryMethodData);
  }
}
