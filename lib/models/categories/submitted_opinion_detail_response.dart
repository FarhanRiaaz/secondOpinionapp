// To parse this JSON data, do
//
//     final subProfileResponse = subProfileResponseFromJson(jsonString);

import 'dart:convert';

class SubmittedOpinionDetailResponse {
  SubProfileResponseRequest? request;
  List<RequestSubmittedUserDatum>? requestSubmittedUserData;

  SubmittedOpinionDetailResponse({
    this.request,
    this.requestSubmittedUserData,
  });

  SubmittedOpinionDetailResponse copyWith({
    SubProfileResponseRequest? request,
    List<RequestSubmittedUserDatum>? requestSubmittedUserData,
  }) =>
      SubmittedOpinionDetailResponse(
        request: request ?? this.request,
        requestSubmittedUserData: requestSubmittedUserData ?? this.requestSubmittedUserData,
      );

  factory SubmittedOpinionDetailResponse.fromRawJson(String str) => SubmittedOpinionDetailResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SubmittedOpinionDetailResponse.fromJson(Map<String, dynamic> json) => SubmittedOpinionDetailResponse(
    request: json["request"] == null ? null : SubProfileResponseRequest.fromJson(json["request"]),
    requestSubmittedUserData: json["request_submitted_user_data"] == null ? [] : List<RequestSubmittedUserDatum>.from(json["request_submitted_user_data"]!.map((x) => RequestSubmittedUserDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "request": request?.toJson(),
    "request_submitted_user_data": requestSubmittedUserData == null ? [] : List<dynamic>.from(requestSubmittedUserData!.map((x) => x.toJson())),
  };
}

class SubProfileResponseRequest {
  int? id;
  RequestRequest? request;
  String? status;
  String? chatRoom;
  String? totalPrice;
  int? totalNo;
  String? paymentTransactionNo;
  DateTime? createdDate;
  bool? isPending;
  bool? isApproved;
  bool? isRuning;
  bool? isComplete;
  bool? isOpened;
  bool? paymentCompleted;
  List<dynamic>? doctors;

  SubProfileResponseRequest({
    this.id,
    this.request,
    this.status,
    this.chatRoom,
    this.totalPrice,
    this.totalNo,
    this.paymentTransactionNo,
    this.createdDate,
    this.isPending,
    this.isApproved,
    this.isRuning,
    this.isComplete,
    this.isOpened,
    this.paymentCompleted,
    this.doctors,
  });

  SubProfileResponseRequest copyWith({
    int? id,
    RequestRequest? request,
    String? status,
    String? chatRoom,
    String? totalPrice,
    int? totalNo,
    String? paymentTransactionNo,
    DateTime? createdDate,
    bool? isPending,
    bool? isApproved,
    bool? isRuning,
    bool? isComplete,
    bool? isOpened,
    bool? paymentCompleted,
    List<dynamic>? doctors,
  }) =>
      SubProfileResponseRequest(
        id: id ?? this.id,
        request: request ?? this.request,
        status: status ?? this.status,
        chatRoom: chatRoom ?? this.chatRoom,
        totalPrice: totalPrice ?? this.totalPrice,
        totalNo: totalNo ?? this.totalNo,
        paymentTransactionNo: paymentTransactionNo ?? this.paymentTransactionNo,
        createdDate: createdDate ?? this.createdDate,
        isPending: isPending ?? this.isPending,
        isApproved: isApproved ?? this.isApproved,
        isRuning: isRuning ?? this.isRuning,
        isComplete: isComplete ?? this.isComplete,
        isOpened: isOpened ?? this.isOpened,
        paymentCompleted: paymentCompleted ?? this.paymentCompleted,
        doctors: doctors ?? this.doctors,
      );

  factory SubProfileResponseRequest.fromRawJson(String str) => SubProfileResponseRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SubProfileResponseRequest.fromJson(Map<String, dynamic> json) => SubProfileResponseRequest(
    id: json["id"],
    request: json["request"] == null ? null : RequestRequest.fromJson(json["request"]),
    status: json["status"],
    chatRoom: json["chat_room"],
    totalPrice: json["total_price"],
    totalNo: json["total_no"],
    paymentTransactionNo: json["payment_transaction_no"],
    createdDate: json["created_date"] == null ? null : DateTime.parse(json["created_date"]),
    isPending: json["is_pending"],
    isApproved: json["is_approved"],
    isRuning: json["is_runing"],
    isComplete: json["is_complete"],
    isOpened: json["is_opened"],
    paymentCompleted: json["payment_completed"],
    doctors: json["doctors"] == null ? [] : List<dynamic>.from(json["doctors"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "request": request?.toJson(),
    "status": status,
    "chat_room": chatRoom,
    "total_price": totalPrice,
    "total_no": totalNo,
    "payment_transaction_no": paymentTransactionNo,
    "created_date": createdDate?.toIso8601String(),
    "is_pending": isPending,
    "is_approved": isApproved,
    "is_runing": isRuning,
    "is_complete": isComplete,
    "is_opened": isOpened,
    "payment_completed": paymentCompleted,
    "doctors": doctors == null ? [] : List<dynamic>.from(doctors!.map((x) => x)),
  };
}

class RequestRequest {
  int? id;
  Form? form;
  RequestUser? user;
  Mainuser? mainuser;
  bool? isSubUser;

  RequestRequest({
    this.id,
    this.form,
    this.user,
    this.mainuser,
    this.isSubUser,
  });

  RequestRequest copyWith({
    int? id,
    Form? form,
    RequestUser? user,
    Mainuser? mainuser,
    bool? isSubUser,
  }) =>
      RequestRequest(
        id: id ?? this.id,
        form: form ?? this.form,
        user: user ?? this.user,
        mainuser: mainuser ?? this.mainuser,
        isSubUser: isSubUser ?? this.isSubUser,
      );

  factory RequestRequest.fromRawJson(String str) => RequestRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RequestRequest.fromJson(Map<String, dynamic> json) => RequestRequest(
    id: json["id"],
    form: json["form"] == null ? null : Form.fromJson(json["form"]),
    user: json["user"] == null ? null : RequestUser.fromJson(json["user"]),
    mainuser: json["mainuser"] == null ? null : Mainuser.fromJson(json["mainuser"]),
    isSubUser: json["is_sub_user"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "form": form?.toJson(),
    "user": user?.toJson(),
    "mainuser": mainuser?.toJson(),
    "is_sub_user": isSubUser,
  };
}

class Form {
  int? id;
  Category? category;
  String? title;

  Form({
    this.id,
    this.category,
    this.title,
  });

  Form copyWith({
    int? id,
    Category? category,
    String? title,
  }) =>
      Form(
        id: id ?? this.id,
        category: category ?? this.category,
        title: title ?? this.title,
      );

  factory Form.fromRawJson(String str) => Form.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Form.fromJson(Map<String, dynamic> json) => Form(
    id: json["id"],
    category: json["category"] == null ? null : Category.fromJson(json["category"]),
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category": category?.toJson(),
    "title": title,
  };
}

class Category {
  int? id;
  String? title;
  int? price;
  String? image;

  Category({
    this.id,
    this.title,
    this.price,
    this.image,
  });

  Category copyWith({
    int? id,
    String? title,
    int? price,
    String? image,
  }) =>
      Category(
        id: id ?? this.id,
        title: title ?? this.title,
        price: price ?? this.price,
        image: image ?? this.image,
      );

  factory Category.fromRawJson(String str) => Category.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    title: json["title"],
    price: json["price"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "image": image,
  };
}

class Mainuser {
  int? id;
  MainuserUser? user;
  String? phone;
  String? profileImg;
  String? gender;
  String? age;
  String? weight;
  String? height;
  String? weightUnit;
  String? heightUnit;

  Mainuser({
    this.id,
    this.user,
    this.phone,
    this.profileImg,
    this.gender,
    this.age,
    this.weight,
    this.height,
    this.weightUnit,
    this.heightUnit,
  });

  Mainuser copyWith({
    int? id,
    MainuserUser? user,
    String? phone,
    String? profileImg,
    String? gender,
    String? age,
    String? weight,
    String? height,
    String? weightUnit,
    String? heightUnit,
  }) =>
      Mainuser(
        id: id ?? this.id,
        user: user ?? this.user,
        phone: phone ?? this.phone,
        profileImg: profileImg ?? this.profileImg,
        gender: gender ?? this.gender,
        age: age ?? this.age,
        weight: weight ?? this.weight,
        height: height ?? this.height,
        weightUnit: weightUnit ?? this.weightUnit,
        heightUnit: heightUnit ?? this.heightUnit,
      );

  factory Mainuser.fromRawJson(String str) => Mainuser.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Mainuser.fromJson(Map<String, dynamic> json) => Mainuser(
    id: json["id"],
    user: json["user"] == null ? null : MainuserUser.fromJson(json["user"]),
    phone: json["phone"],
    profileImg: json["profileImg"],
    gender: json["gender"],
    age: json["age"],
    weight: json["weight"],
    height: json["height"],
    weightUnit: json["weight_unit"],
    heightUnit: json["height_unit"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user": user?.toJson(),
    "phone": phone,
    "profileImg": profileImg,
    "gender": gender,
    "age": age,
    "weight": weight,
    "height": height,
    "weight_unit": weightUnit,
    "height_unit": heightUnit,
  };
}

class MainuserUser {
  String? name;
  String? email;

  MainuserUser({
    this.name,
    this.email,
  });

  MainuserUser copyWith({
    String? name,
    String? email,
  }) =>
      MainuserUser(
        name: name ?? this.name,
        email: email ?? this.email,
      );

  factory MainuserUser.fromRawJson(String str) => MainuserUser.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MainuserUser.fromJson(Map<String, dynamic> json) => MainuserUser(
    name: json["name"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
  };
}

class RequestUser {
  int? id;
  String? profileImg;
  String? name;
  String? relationShip;
  String? color;
  String? gender;
  String? age;
  String? weight;
  String? height;
  String? weightUnit;
  String? heightUnit;
  int? user;

  RequestUser({
    this.id,
    this.profileImg,
    this.name,
    this.relationShip,
    this.color,
    this.gender,
    this.age,
    this.weight,
    this.height,
    this.weightUnit,
    this.heightUnit,
    this.user,
  });

  RequestUser copyWith({
    int? id,
    String? profileImg,
    String? name,
    String? relationShip,
    String? color,
    String? gender,
    String? age,
    String? weight,
    String? height,
    String? weightUnit,
    String? heightUnit,
    int? user,
  }) =>
      RequestUser(
        id: id ?? this.id,
        profileImg: profileImg ?? this.profileImg,
        name: name ?? this.name,
        relationShip: relationShip ?? this.relationShip,
        color: color ?? this.color,
        gender: gender ?? this.gender,
        age: age ?? this.age,
        weight: weight ?? this.weight,
        height: height ?? this.height,
        weightUnit: weightUnit ?? this.weightUnit,
        heightUnit: heightUnit ?? this.heightUnit,
        user: user ?? this.user,
      );

  factory RequestUser.fromRawJson(String str) => RequestUser.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RequestUser.fromJson(Map<String, dynamic> json) => RequestUser(
    id: json["id"],
    profileImg: json["profileImg"],
    name: json["name"],
    relationShip: json["relation_ship"],
    color: json["color"],
    gender: json["gender"],
    age: json["age"],
    weight: json["weight"],
    height: json["height"],
    weightUnit: json["weight_unit"],
    heightUnit: json["height_unit"],
    user: json["user"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "profileImg": profileImg,
    "name": name,
    "relation_ship": relationShip,
    "color": color,
    "gender": gender,
    "age": age,
    "weight": weight,
    "height": height,
    "weight_unit": weightUnit,
    "height_unit": heightUnit,
    "user": user,
  };
}

class RequestSubmittedUserDatum {
  int? id;
  Question? question;
  String? typeQ;
  String? answer;
  int? request;

  RequestSubmittedUserDatum({
    this.id,
    this.question,
    this.typeQ,
    this.answer,
    this.request,
  });

  RequestSubmittedUserDatum copyWith({
    int? id,
    Question? question,
    String? typeQ,
    String? answer,
    int? request,
  }) =>
      RequestSubmittedUserDatum(
        id: id ?? this.id,
        question: question ?? this.question,
        typeQ: typeQ ?? this.typeQ,
        answer: answer ?? this.answer,
        request: request ?? this.request,
      );

  factory RequestSubmittedUserDatum.fromRawJson(String str) => RequestSubmittedUserDatum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RequestSubmittedUserDatum.fromJson(Map<String, dynamic> json) => RequestSubmittedUserDatum(
    id: json["id"],
    question: json["question"] == null ? null : Question.fromJson(json["question"]),
    typeQ: json["typeQ"],
    answer: json["answer"],
    request: json["request"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "question": question?.toJson(),
    "typeQ": typeQ,
    "answer": answer,
    "request": request,
  };
}

class Question {
  int? id;
  String? type;
  String? question;
  List<Option>? options;

  Question({
    this.id,
    this.type,
    this.question,
    this.options,
  });

  Question copyWith({
    int? id,
    String? type,
    String? question,
    List<Option>? options,
  }) =>
      Question(
        id: id ?? this.id,
        type: type ?? this.type,
        question: question ?? this.question,
        options: options ?? this.options,
      );

  factory Question.fromRawJson(String str) => Question.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Question.fromJson(Map<String, dynamic> json) => Question(
    id: json["id"],
    type: json["type"],
    question: json["question"],
    options: json["options"] == null ? [] : List<Option>.from(json["options"]!.map((x) => Option.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "question": question,
    "options": options == null ? [] : List<dynamic>.from(options!.map((x) => x.toJson())),
  };
}

class Option {
  String? option;
  int? question;

  Option({
    this.option,
    this.question,
  });

  Option copyWith({
    String? option,
    int? question,
  }) =>
      Option(
        option: option ?? this.option,
        question: question ?? this.question,
      );

  factory Option.fromRawJson(String str) => Option.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Option.fromJson(Map<String, dynamic> json) => Option(
    option: json["option"],
    question: json["question"],
  );

  Map<String, dynamic> toJson() => {
    "option": option,
    "question": question,
  };
}
