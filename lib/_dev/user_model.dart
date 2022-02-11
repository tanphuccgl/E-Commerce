class User {
  String? name;
  int? age;
  int? sex;

  User({this.name, this.age, this.sex});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    age = json['age'];
    sex = json['sex'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['age'] = age;
    data['sex'] = sex;
    return data;
  }
}
