import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/src/models/firestore_model.dart';

class XUser extends BaseModel {
  String? name;
  String? email;

  XUser({this.name, this.email, String id = ""}) : super(id: id);

  factory XUser.fromJson(Map<String, dynamic> json, {String? id}) {
    return XUser(
        name: json['name'], email: json['email'], id: id ?? json['id']);
  }

  // factory XUser.fromFirebaseUser(User user) {
  // TODO
  // }
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
    return data;
  }
}
