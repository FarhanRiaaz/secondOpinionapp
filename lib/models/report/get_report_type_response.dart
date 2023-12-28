class AllReportTypeResponse {
  final List<ReportTypeResponse>? allReportTypeResponse;

  AllReportTypeResponse({
    this.allReportTypeResponse,
  });

  factory AllReportTypeResponse.fromJson(List<dynamic> json) {
    List<ReportTypeResponse> allReportTypeResponseList = <ReportTypeResponse>[];
    allReportTypeResponseList = json
        .map((allReport) => ReportTypeResponse.fromMap(allReport))
        .toList();

    return AllReportTypeResponse(
      allReportTypeResponse: allReportTypeResponseList,
    );
  }
}

class ReportTypeResponse {
  int? id;
  String? title;

  ReportTypeResponse({
    this.id,
    this.title,
  });

  ReportTypeResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }

  factory ReportTypeResponse.fromMap(Map<String, dynamic> json) =>
      ReportTypeResponse(
        id: json['id'],
        title: json['title'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }

  ReportTypeResponse copyWith({
    int? id,
    String? title,
  }) =>
      ReportTypeResponse(
        id: id ?? this.id,
        title: title ?? this.title,
      );
}
