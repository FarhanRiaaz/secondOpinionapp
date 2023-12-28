class LoginUserResponse {
  String? token;
  User? user;
  String? error;

  LoginUserResponse({
    this.token,
    this.user,
    this.error,
  });

  LoginUserResponse.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['error'] = this.error;
    return data;
  }

  factory LoginUserResponse.fromMap(Map<String, dynamic> json) =>
      LoginUserResponse(
        token: json["token"],
        user: json["user"],
        error: json["error"],
      );

  Map<String, dynamic> toMap() => {
        "token": token,
        "user": user,
        "error": error,
      };

  LoginUserResponse copyWith({
    String? token,
    User? user,
    String? error,
  }) =>
      LoginUserResponse(
        token: token ?? this.token,
        user: user ?? this.user,
        error: error ?? this.error,
      );
}

class User {
  String? name;
  String? email;

  User({
    this.name,
    this.email,
  });

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;

    return data;
  }

  factory User.fromMap(Map<String, dynamic> json) => User(
        name: json["name"],
        email: json["email"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "email": email,
      };

  User copyWith({
    String? name,
    String? email,
  }) =>
      User(
        name: name ?? this.name,
        email: email ?? this.email,
      );
}
