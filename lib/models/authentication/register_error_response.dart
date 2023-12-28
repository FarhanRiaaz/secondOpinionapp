class RegisterErrorResponse {
  List<String>? email;

  RegisterErrorResponse({
    this.email,
  });

  RegisterErrorResponse.fromJson(Map<String, dynamic> json) {
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    return data;
  }

  factory RegisterErrorResponse.fromMap(Map<String, dynamic> json) =>
      RegisterErrorResponse(
        email: json["email"],
      );

  Map<String, dynamic> toMap() => {
        "email": email,
      };

  RegisterErrorResponse copyWith({
    List<String>? email,
  }) =>
      RegisterErrorResponse(
        email: email ?? this.email,
      );
}
