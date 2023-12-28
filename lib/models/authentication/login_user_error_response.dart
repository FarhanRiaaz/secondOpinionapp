class LoginUserErrorResponse {
  String? error;

  LoginUserErrorResponse({
    this.error,
  });

  LoginUserErrorResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    return data;
  }

  factory LoginUserErrorResponse.fromMap(Map<String, dynamic> json) =>
      LoginUserErrorResponse(
        error: json["error"],
      );

  Map<String, dynamic> toMap() => {
        "error": error,
      };

  LoginUserErrorResponse copyWith({
    String? error,
  }) =>
      LoginUserErrorResponse(
        error: error ?? this.error,
      );
}
