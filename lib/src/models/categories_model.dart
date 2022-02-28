import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/src/models/firestore_model.dart';

class XCategories extends BaseModel {
  String? name;
  int? idCategory;

  XCategories({int? id, this.name, this.idCategory}) : super(id: id.toString());

  factory XCategories.fromJson(Map<String, dynamic> json) {
    return XCategories(name: json['name'], idCategory: json['id']);
  }
  factory XCategories.empty() {
    return XCategories();
  }
  factory XCategories.formDocument(DocumentSnapshot doc) {
    return XCategories.fromJson(doc.data() as Map<String, dynamic>);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = idCategory;
    data['name'] = name;
    return data;
  }
}
