import 'package:e_commerce/src/models/firestore_model.dart';

class UserModel extends BaseModel {
  String? name;
  String? email;

  UserModel({this.name, this.email}) : super(id: '');

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    return data;
  }
}
