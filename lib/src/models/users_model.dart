import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/src/models/firestore_model.dart';
import 'package:e_commerce/src/models/shipping_address_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class XUser extends BaseModel {
  String? name;
  String? email;
  String? urlAvatar;
  String? birthDay;
  String? accountType;
  List<XShippingAddress>? shippingAddresses;

  XUser(
      {this.name,
      this.email,
      String id = "",
      this.urlAvatar,
      this.birthDay,
      this.accountType,
      this.shippingAddresses})
      : super(id: id);

  factory XUser.fromJson(Map<String, dynamic> json, {String? id}) {
    //print();
    // var list = json['shippingAddresses'] as List;

    // List<XShippingAddress>? itemsList =
    //     list.map((i) => XShippingAddress.fromJson(i)).toList();

    // print("asf ${itemsList.length}");
    // // print(list.length);
    return XUser(
        name: json['name'],
        email: json['email'],
        id: id ?? json['id'],
        urlAvatar: json['urlAvatar'],
        birthDay: json['birthDay'],
        accountType: json['accountType'],
        shippingAddresses: (json['shippingAddresses'] as List)
            .map((e) => XShippingAddress.fromJson(e))
            .toList());
  }

  factory XUser.fromFirebaseUser(User user) {
    return XUser(
      email: user.email,
      id: user.uid,
      name: user.displayName,
    );
  }
  factory XUser.empty() {
    return XUser();
  }
  factory XUser.formDocument(DocumentSnapshot doc) {
    return XUser.fromJson(doc.data() as Map<String, dynamic>);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['id'] = id;
    data['urlAvatar'] = urlAvatar;
    data['birthDay'] = birthDay;
    data['accountType'] = accountType;
    data['shippingAddresses'] =
        shippingAddresses!.map((v) => v.toJson()).toList();

    return data;
  }
}
