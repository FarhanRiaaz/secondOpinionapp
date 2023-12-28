import 'dart:io';

class SubProfileRequest {
  String? name;
  File? profileImg;
  String? age;
  String? color;
  String? gender;
  String? weight;
  String? height;
  String? heightUnit;
  String? weightUnit;
  String? relationship;

  SubProfileRequest({
    this.name,
    this.profileImg,
    this.age,
    this.color,
    this.gender,
    this.weight,
    this.height,
    this.heightUnit = 'feet',
    this.weightUnit = 'kg',
    this.relationship,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {
      'name': name,
      'profileImg': profileImg,
      'gender': gender,
      'age': age,
      'weight': weight,
      'color': color,
      'height': height,
      'height_unit': heightUnit,
      'weight_unit': weightUnit,
      'relation_ship': relationship, // Added relationship field
    };

    return data;
  }

  SubProfileRequest copyWith({
    String? name,
    File? profileImg,
    String? age,
    String? color,
    String? gender,
    String? weight,
    String? height,
    String? heightUnit,
    String? weightUnit,
    String? relationship,
  }) =>
      SubProfileRequest(
        name: name ?? this.name,
        profileImg: profileImg ?? this.profileImg,
        age: age ?? this.age,
        color: color ?? this.color,
        gender: gender ?? this.gender,
        weight: weight ?? this.weight,
        height: height ?? this.height,
        heightUnit: heightUnit ?? this.heightUnit,
        weightUnit: weightUnit ?? this.weightUnit,
        relationship: relationship ?? this.relationship, // Added relationship field
      );
}
