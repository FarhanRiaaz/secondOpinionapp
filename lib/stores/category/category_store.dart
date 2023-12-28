import 'package:mobx/mobx.dart';
import 'package:second_opinion_app/models/categories/all_category_list.dart';
import 'package:second_opinion_app/models/categories/category_instance_response.dart';
import 'package:second_opinion_app/models/categories/opinion_request.dart';
import 'package:second_opinion_app/models/categories/opinion_response.dart';
import 'package:second_opinion_app/models/categories/submitted_opinion_detail_response.dart';
import 'package:second_opinion_app/models/categories/submitted_opinion_response.dart';
import 'package:second_opinion_app/models/slider/slider_images_response.dart';
import '../../data/repository/category_repository.dart';

part 'category_store.g.dart';

class CategoryStore = _CategoryStore with _$CategoryStore;

abstract class _CategoryStore with Store {
  final CategoryRepository _categoryRepository;

  // empty responses:-----------------------------------------------------------
  static ObservableFuture<AllCategoryList> emptyGetAllCategoryResponse = ObservableFuture.value(AllCategoryList());

  static ObservableFuture<AllSliderImageResponse> emptyGetSliderImagesResponse = ObservableFuture.value(AllSliderImageResponse());

  static ObservableFuture<CategoryInstanceResponse> emptyCategoryInstanceResponse = ObservableFuture.value(CategoryInstanceResponse());
  static ObservableFuture<OpinionSubmitResponse> emptyOpinionSubmitResponse = ObservableFuture.value(OpinionSubmitResponse());

  static ObservableFuture<SecondOpinionSubmittedResponse> emptyOpinionSubmittedResponse =
      ObservableFuture.value(SecondOpinionSubmittedResponse());

  static ObservableFuture<SubmittedOpinionDetailResponse> emptyOpinionSubmittedDetailResponse =
      ObservableFuture.value(SubmittedOpinionDetailResponse());

  @observable
  ObservableFuture<AllCategoryList> allCategoryFuture = emptyGetAllCategoryResponse;

  @observable
  ObservableFuture<AllSliderImageResponse> sliderImagesFuture = emptyGetSliderImagesResponse;

  @observable
  ObservableFuture<CategoryInstanceResponse> allCategoryInstanceFuture = emptyCategoryInstanceResponse;

  @observable
  ObservableFuture<OpinionSubmitResponse> opinionSubmitResponseFuture = emptyOpinionSubmitResponse;

  @observable
  ObservableFuture<SecondOpinionSubmittedResponse> opinionSubmittedResponseFuture = emptyOpinionSubmittedResponse;

  @observable
  ObservableFuture<SubmittedOpinionDetailResponse> opinionSubmittedDetailResponseFuture = emptyOpinionSubmittedDetailResponse;

  @observable
  AllCategoryList? allCategoryList;

  @observable
  AllSliderImageResponse? sliderImageResponse;

  @observable
  CategoryInstanceResponse? categoryInstanceResponse;

  @observable
  OpinionSubmitResponse? opinionSubmitResponse;

  @observable
  SecondOpinionSubmittedResponse? opinionSubmittedResponse;

  @observable
  SubmittedOpinionDetailResponse? opinionSubmittedDetailResponse;

  @computed
  bool get isAllCategoriesInProcess => allCategoryFuture.status == FutureStatus.pending;

  @computed
  bool get isCategoriesInstanceInProcess => allCategoryInstanceFuture.status == FutureStatus.pending;

  @computed
  bool get isSubmittedDetailInstanceInProcess => opinionSubmittedDetailResponseFuture.status == FutureStatus.pending;
 @computed
  bool get isOpinionSubmittingInProcess => opinionSubmitResponseFuture.status == FutureStatus.pending;

  @action
  Future getAllCategories() async {
    final future = _categoryRepository.getAllCategories();
    allCategoryFuture = ObservableFuture(future);
    await future.then((value) async {
      if (value.allCategoryList != null) {
        allCategoryList = value;
      } else {
        print('failed to getAllCategories\nSomething went wrong');
      }
    }).catchError((e) {
      print(e);

      print('failed to getAllCategories\nSomething went wrong!\n${e.toString()}');
      throw e;
    });
  }

  @action
  Future getSliderImages() async {
    final future = _categoryRepository.getSliderImages();
    sliderImagesFuture = ObservableFuture(future);
    await future.then((value) async {
      if (value != null) {
        sliderImageResponse = value;
      } else {
        print('failed to getSliderImages\nSomething went wrong');
      }
    }).catchError((e) {
      print(e);

      print('failed to getSliderImages\nSomething went wrong!\n${e.toString()}');
      throw e;
    });
  }

  @action
  Future getFilteredCategories(String searchText) async {
    final future = _categoryRepository.getFilteredCategories(searchText);
    allCategoryFuture = ObservableFuture(future);
    await future.then((value) async {
      if (value.allCategoryList != null) {
        allCategoryList = value;
      } else {
        print('failed to getFilteredCategories\nSomething went wrong');
      }
    }).catchError((e) {
      print(e);

      print('failed to getFilteredCategories\nSomething went wrong!\n${e.toString()}');
      throw e;
    });
  }

  @action
  Future getFormByCategory(int catId) async {
    final future = _categoryRepository.getFormByCategory(catId);
    allCategoryInstanceFuture = ObservableFuture(future);
    await future.then((value) async {
      if (value != null) {
        categoryInstanceResponse = value;
      } else {
        print('failed to getFormByCategory\nSomething went wrong');
      }
    }).catchError((e) {
      print(e);

      print('failed to getFormByCategory\nSomething went wrong!\n${e.toString()}');
      throw e;
    });
  }

  @action
  Future submitSecondOpinion(OpinionSubmitRequest request) async {
    final future = _categoryRepository.submitSecondOpinion(request);
    opinionSubmitResponseFuture = ObservableFuture(future);
    await future.then((value) async {
      if (value != null) {
        opinionSubmitResponse = value;
      } else {
        print('failed to submitSecondOpinion\nSomething went wrong');
      }
    }).catchError((e) {
      print(e);

      print('failed to submitSecondOpinion\nSomething went wrong!\n${e.toString()}');
      throw e;
    });
  }

  @action
  Future getSecondOpinionSubmittedList(String? searchString, String? sort, String? userName) async {
    final future = _categoryRepository.getSecondOpinionSubmittedList(searchString, sort, userName);
    opinionSubmittedResponseFuture = ObservableFuture(future);


    await future.then((value) async {
      if (value != null) {
        opinionSubmittedResponse = value;

      } else {
        print('failed to getSecondOpinionSubmittedList\nSomething went wrong');
      }
    }).catchError((e) {
      print(e);

      print('failed to getSecondOpinionSubmittedList\nSomething went wrong!\n${e.toString()}');
      throw e;
    });
  }
  @action
  Future getSecondOpinionSubmittedDetail(String? id) async {
    final future = _categoryRepository.getSecondOpinionSubmittedDetail(id);
    opinionSubmittedDetailResponseFuture = ObservableFuture(future);


    await future.then((value) async {
      if (value != null) {
        opinionSubmittedDetailResponse = value;

      } else {
        print('failed to getSecondOpinionSubmittedList\nSomething went wrong');
      }
    }).catchError((e) {
      print(e);

      print('failed to getSecondOpinionSubmittedList\nSomething went wrong!\n${e.toString()}');
      throw e;
    });
  }

  _CategoryStore(
    CategoryRepository categoryRepository,
  ) : this._categoryRepository = categoryRepository {}
}
