class RegisterUserResponse {
  String? name;
  String? email;

  RegisterUserResponse({
    this.name,
    this.email,
  });

  RegisterUserResponse.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;

    return data;
  }

  factory RegisterUserResponse.fromMap(Map<String, dynamic> json) =>
      RegisterUserResponse(
        name: json["name"],
        email: json["email"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "email": email,
      };

  RegisterUserResponse copyWith({
    String? name,
    String? email,
  }) =>
      RegisterUserResponse(
        name: name ?? this.name,
        email: email ?? this.email,
      );
}
