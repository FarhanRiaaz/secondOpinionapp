class OpinionSubmitResponse {
  bool? status;
  String? message;

  OpinionSubmitResponse({
    this.status,
    this.message,
  });

  OpinionSubmitResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }

  OpinionSubmitResponse copyWith({
    bool? status,
    String? message,
  }) =>
      OpinionSubmitResponse(
        status: status ?? this.status,
        message: message ?? this.message,
      );
}
