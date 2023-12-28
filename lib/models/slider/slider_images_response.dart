
class AllSliderImageResponse {
  final List<SliderImageResponse>? allSliderImageResponse;

  AllSliderImageResponse({
    this.allSliderImageResponse,
  });

  factory AllSliderImageResponse.fromJson(List<dynamic> json) {
    List<SliderImageResponse> allSliderResponseList = <SliderImageResponse>[];
    allSliderResponseList = json
        .map((allCategory) => SliderImageResponse.fromMap(allCategory))
        .toList();

    return AllSliderImageResponse(
      allSliderImageResponse: allSliderResponseList,
    );
  }
}

class SliderImageResponse {
  int? id;
  String? image;
  String? link;

  SliderImageResponse({
    this.id,
    this.image,
    this.link,
  });

  SliderImageResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    link = json['link'];
  }

  factory SliderImageResponse.fromMap(Map<String, dynamic> json) =>
      SliderImageResponse(
        id: json['id'],
        link: json['link'],
        image: json['image'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['link'] = this.link;
    return data;
  }

  SliderImageResponse copyWith({
    int? id,
    String? image,
    String? link,
  }) =>
      SliderImageResponse(
        id: id ?? this.id,
        image: image ?? this.image,
        link: link ?? this.link,
      );
}
