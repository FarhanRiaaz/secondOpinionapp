class UploadReportResponse {
  int? id;
  String? type;
  String? fileName;
  String? file;
  String? user;
  String? createdDate;

  UploadReportResponse({
    this.id,
    this.type,
    this.fileName,
    this.file,
    this.user,
    this.createdDate,
  });

  UploadReportResponse.fromJson(Map<String, dynamic> data) {
    id = data['id'];
    user = data['user'];
    type = data['type'];
    fileName = data['fileName'];
    file = data['file'];
    createdDate = data['createdDate'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user'] = this.user;
    data['type'] = this.type;
    data['fileName'] = this.fileName;
    data['file'] = this.file;
    data['createdDate'] = this.createdDate;

    return data;
  }

  factory UploadReportResponse.fromMap(Map<String, dynamic> data) =>
      UploadReportResponse(
        id: data['id'],
        user: data['user'],
        type: data['type'],
        fileName: data['fileName'],
        file: data['file'],
        createdDate: data['createdDate'],
      );

  Map<String, dynamic> toMap() => {
    'id': id,
    'user': user,
    'type': type,
    'fileName': fileName,
    'file': file,
    'createdDate': createdDate,
  };

  UploadReportResponse copyWith({
    int? id,
    String? type,
    String? fileName,
    String? file,
    String? user,
    String? createdDate,
  }) =>
      UploadReportResponse(
        id: id ?? this.id,
        type: type ?? this.type,
        fileName: fileName ?? this.fileName,
        file: file ?? this.file,
        user: user ?? this.user,
        createdDate: createdDate ?? this.createdDate,
      );
}


class User {
  int? id;
  String? profileImg;
  String? name;
  String? color;
  String? gender;
  String? age;
  String? weight;
  String? height;
  int? user;

  User({
    this.id,
    this.profileImg,
    this.name,
    this.color,
    this.gender,
    this.age,
    this.weight,
    this.height,
    this.user,
  });

  User.fromJson(Map<String, dynamic> data) {
    id = data['id'];
    profileImg = data['profileImg'];
    name = data['name'];
    user = data['user'];
    color = data['color'];
    gender = data['gender'];
    age = data['age'];
    weight = data['weight'];
    height = data['height'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['profileImg'] = this.profileImg;
    data['name'] = this.name;
    data['user'] = this.user;
    data['color'] = this.color;
    data['gender'] = this.gender;
    data['age'] = this.age;
    data['weight'] = this.weight;
    data['height'] = this.height;

    return data;
  }

  User copyWith({
    int? id,
    String? profileImg,
    String? name,
    String? color,
    String? gender,
    String? age,
    String? weight,
    String? height,
    int? user,
  }) =>
      User(
        id: id ?? this.id,
        profileImg: profileImg ?? this.profileImg,
        name: name ?? this.name,
        color: color ?? this.color,
        gender: gender ?? this.gender,
        age: age ?? this.age,
        weight: weight ?? this.weight,
        height: height ?? this.height,
        user: user ?? this.user,
      );
}
