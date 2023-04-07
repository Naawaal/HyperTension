class UserSignupModel {
  String? phone;
  String? name;
  String? gender;
  int? age;
  double? height;
  double? weight;
  String? occupation;
  String? uid;
  String? date;
  bool? hasHyperTension;

  UserSignupModel({
    this.phone,
    this.name,
    this.gender,
    this.age,
    this.height,
    this.weight,
    this.occupation,
    this.uid,
    this.date,
    this.hasHyperTension,
  });

  UserSignupModel.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    name = json['name'];
    gender = json['gender'];
    age = json['age'];
    height = json['height'];
    weight = json['weight'];
    occupation = json['occupation'];
    uid = json['uid'];
    date = json['date'];
    hasHyperTension = json['hasHyperTension'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phone'] = phone;
    data['name'] = name;
    data['gender'] = gender;
    data['age'] = age;
    data['height'] = height;
    data['weight'] = weight;
    data['occupation'] = occupation;
    data['uid'] = uid;
    data['date'] = date;
    data['hasHyperTension'] = hasHyperTension;
    return data;
  }
}
