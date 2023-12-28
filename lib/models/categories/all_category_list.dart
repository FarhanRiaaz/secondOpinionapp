import 'package:second_opinion_app/models/categories/all_category_response.dart';

class AllCategoryList {
  final List<GetAllCategoryResponse>? allCategoryList;

  AllCategoryList({
    this.allCategoryList,
  });

  factory AllCategoryList.fromJson(List<dynamic> json) {
    List<GetAllCategoryResponse> allCategoryList = <GetAllCategoryResponse>[];
    allCategoryList = json
        .map((allCategory) => GetAllCategoryResponse.fromMap(allCategory))
        .toList();

    return AllCategoryList(
      allCategoryList: allCategoryList,
    );
  }
}

