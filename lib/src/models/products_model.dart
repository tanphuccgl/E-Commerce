import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/src/models/firestore_model.dart';
import 'package:e_commerce/src/models/review_model.dart';

class XProduct extends BaseModel {
  String name;
  String? image;
  int star;
  String type;
  String? color;
  String? size;
  double originalPrice;
  double? discount;
  double? currentPrice;
  bool? newProduct;
  String idCategory;
  String nameCategory;
  String? idUser;
  bool soldOut;
  int amount;
  bool favorite;
  List<XReview>? listReview;

  XProduct(
      {this.name = '',
      this.listReview,
      this.idCategory = '',
      this.nameCategory = '',
      String id = '',
      this.favorite = false,
      this.image,
      this.star = 0,
      this.type = '',
      this.color,
      this.size,
      this.originalPrice = 0,
      this.discount,
      this.currentPrice,
      this.idUser,
      this.soldOut = false,
      this.newProduct,
      this.amount = 0})
      : super(id: id);

  factory XProduct.fromJson(Map<String, dynamic> json) {
    List<XReview> listReviews = <XReview>[];
    json['listReview'].forEach((v) {
      listReviews.add(XReview.fromJson(v));
    });
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
        id: json['id'],
        idCategory: json['idCategory'],
        nameCategory: json['nameCategory'],
        idUser: json['idUser'],
        soldOut: json['soldOut'],
        amount: json['amount'],
        favorite: json['favorite'],
        listReview: listReviews);
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
    data['idCategory'] = idCategory;
    data['nameCategory'] = nameCategory;
    data['idUser'] = idUser;
    data['soldOut'] = soldOut;
    data['amount'] = amount;
    data['favorite'] = favorite;
    data['listReview'] = listReview?.map((v) => v.toJson()).toList();

    return data;
  }
}
