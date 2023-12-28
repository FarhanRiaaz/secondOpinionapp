import 'package:second_opinion_app/data/network/apis/category/catergory_api.dart';
import 'package:second_opinion_app/models/categories/all_category_list.dart';
import 'package:second_opinion_app/models/categories/all_category_response.dart';
import 'package:second_opinion_app/models/categories/category_instance_response.dart';
import 'package:second_opinion_app/models/categories/opinion_request.dart';
import 'package:second_opinion_app/models/categories/opinion_response.dart';
import 'package:second_opinion_app/models/categories/submitted_opinion_detail_response.dart';
import 'package:second_opinion_app/models/categories/submitted_opinion_response.dart';
import 'package:second_opinion_app/models/slider/slider_images_response.dart';

import '../sharedpref/shared_preference_helper.dart';

class CategoryRepository {
  // api objects
  final CategoryApi _categoryApi;

  // shared pref object
  final SharedPreferenceHelper _sharedPrefsHelper;

  // constructor
  CategoryRepository(this._categoryApi, this._sharedPrefsHelper);

  Future<AllCategoryList> getAllCategories() async {
    final authToken = await _sharedPrefsHelper.authToken;
    print("getAllCategories$authToken");
    return await _categoryApi.getAllCategories(authToken!);
  }

  Future<AllSliderImageResponse> getSliderImages() async {
    final authToken = await _sharedPrefsHelper.authToken;
    print("getSliderImages$authToken");
    return await _categoryApi.getSliderImages(authToken!);
  }

  Future<AllCategoryList> getFilteredCategories(String searchString) async {
    final authToken = await _sharedPrefsHelper.authToken;
    print("getFilteredCategories$authToken");
    return await _categoryApi.getFilteredCategories(authToken!, searchString);
  }

  Future<CategoryInstanceResponse> getFormByCategory(int catType) async {
    final authToken = await _sharedPrefsHelper.authToken;
    print("getFormByCategory$authToken");
    return await _categoryApi.getFormByCategory(authToken!, catType);
  }

  Future<SecondOpinionSubmittedResponse> getSecondOpinionSubmittedList(
      String? searchString,
      String? sort,
      String? userName) async {
    final authToken = await _sharedPrefsHelper.authToken;
    print("getSecondOpinionSubmittedList$authToken");
    return await _categoryApi.getSecondOpinionSubmittedList(searchString,sort,userName,authToken!);
  }

  Future<SubmittedOpinionDetailResponse> getSecondOpinionSubmittedDetail(
      String? id) async {
    final authToken = await _sharedPrefsHelper.authToken;
    print("getSecondOpinionSubmittedList$authToken");
    return await _categoryApi.getSecondOpinionSubmittedDetail(id,authToken!);
  }

  Future<OpinionSubmitResponse> submitSecondOpinion(
      OpinionSubmitRequest request) async {
    final authToken = await _sharedPrefsHelper.authToken;
    print("submitSecondOpinion$authToken");
    return await _categoryApi.submitSecondOpinion(request, authToken!);
  }

  Future<String?> get authToken async => await _sharedPrefsHelper.authToken;
}
