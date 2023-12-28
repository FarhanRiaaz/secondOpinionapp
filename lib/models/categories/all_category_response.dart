class GetAllCategoryResponse {
  int? id;
  String? title;
  String? image;

  GetAllCategoryResponse({
    this.id,
    this.title,
    this.image,
  });

  GetAllCategoryResponse.fromJson(Map<String, dynamic> data) {
    id = data['id'];
    title = data['title'];
    image = data['image'];
  }

  factory GetAllCategoryResponse.fromMap(Map<String, dynamic> json) =>
      GetAllCategoryResponse(
        id: json['id'],
        title: json['title'],
        image: json['image'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    return data;
  }

  GetAllCategoryResponse copyWith({
    int? id,
    String? title,
    dynamic image,
  }) =>
      GetAllCategoryResponse(
        id: id ?? this.id,
        title: title ?? this.title,
        image: image ?? this.image,
      );
}
