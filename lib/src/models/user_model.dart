class UserModel {
  String? name;
  String? email;
  int? age;
  int? sex;

  UserModel({this.name, this.age, this.sex, this.email});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    age = json['age'];
    sex = json['sex'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['age'] = age;
    data['email'] = email;
    data['sex'] = sex;
    return data;
  }
}
