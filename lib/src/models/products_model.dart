import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/src/models/firestore_model.dart';

class XProduct extends BaseModel {
  String? name;
  String? image;
  int? star;
  String? type;
  String? color;
  String? size;
  // to do
  double? originalPrice;
  double? discount;
  double? currentPrice;
  bool? newProduct;

  XProduct(
      {this.name,
      int id = 0,
      this.image,
      this.star,
      this.type,
      this.color,
      this.size,
      this.originalPrice,
      this.discount,
      this.currentPrice,
      this.newProduct})
      : super(id: id.toString());

  factory XProduct.fromJson(Map<String, dynamic> json) {
    return XProduct(
      name: json['name'],
      image: json['image'],
      star: json['star'],
      type: json['type'],
      color: json['color'],
      size: json['size'],
      originalPrice: json['originalPrice'].toDouble(),
      discount: json['discount'].toDouble(),
      currentPrice: json['currentPrice'].toDouble(),
      newProduct: json['newProduct'],
    );
  }
  factory XProduct.empty() {
    return XProduct();
  }
  factory XProduct.formDocument(DocumentSnapshot doc) {
    return XProduct.fromJson(doc.data() as Map<String, dynamic>);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['star'] = star;
    data['type'] = type;
    data['color'] = color;
    data['size'] = size;
    data['originalPrice'] = originalPrice;
    data['discount'] = discount;
    data['currentPrice'] = currentPrice;
    data['newProduct'] = newProduct;
    return data;
  }
}
