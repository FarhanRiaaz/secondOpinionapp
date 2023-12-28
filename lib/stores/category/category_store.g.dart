// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CategoryStore on _CategoryStore, Store {
  Computed<bool>? _$isAllCategoriesInProcessComputed;

  @override
  bool get isAllCategoriesInProcess => (_$isAllCategoriesInProcessComputed ??=
          Computed<bool>(() => super.isAllCategoriesInProcess,
              name: '_CategoryStore.isAllCategoriesInProcess'))
      .value;
  Computed<bool>? _$isCategoriesInstanceInProcessComputed;

  @override
  bool get isCategoriesInstanceInProcess =>
      (_$isCategoriesInstanceInProcessComputed ??= Computed<bool>(
              () => super.isCategoriesInstanceInProcess,
              name: '_CategoryStore.isCategoriesInstanceInProcess'))
          .value;
  Computed<bool>? _$isSubmittedDetailInstanceInProcessComputed;

  @override
  bool get isSubmittedDetailInstanceInProcess =>
      (_$isSubmittedDetailInstanceInProcessComputed ??= Computed<bool>(
              () => super.isSubmittedDetailInstanceInProcess,
              name: '_CategoryStore.isSubmittedDetailInstanceInProcess'))
          .value;

  late final _$allCategoryFutureAtom =
      Atom(name: '_CategoryStore.allCategoryFuture', context: context);

  @override
  ObservableFuture<AllCategoryList> get allCategoryFuture {
    _$allCategoryFutureAtom.reportRead();
    return super.allCategoryFuture;
  }

  @override
  set allCategoryFuture(ObservableFuture<AllCategoryList> value) {
    _$allCategoryFutureAtom.reportWrite(value, super.allCategoryFuture, () {
      super.allCategoryFuture = value;
    });
  }

  late final _$sliderImagesFutureAtom =
      Atom(name: '_CategoryStore.sliderImagesFuture', context: context);

  @override
  ObservableFuture<AllSliderImageResponse> get sliderImagesFuture {
    _$sliderImagesFutureAtom.reportRead();
    return super.sliderImagesFuture;
  }

  @override
  set sliderImagesFuture(ObservableFuture<AllSliderImageResponse> value) {
    _$sliderImagesFutureAtom.reportWrite(value, super.sliderImagesFuture, () {
      super.sliderImagesFuture = value;
    });
  }

  late final _$allCategoryInstanceFutureAtom =
      Atom(name: '_CategoryStore.allCategoryInstanceFuture', context: context);

  @override
  ObservableFuture<CategoryInstanceResponse> get allCategoryInstanceFuture {
    _$allCategoryInstanceFutureAtom.reportRead();
    return super.allCategoryInstanceFuture;
  }

  @override
  set allCategoryInstanceFuture(
      ObservableFuture<CategoryInstanceResponse> value) {
    _$allCategoryInstanceFutureAtom
        .reportWrite(value, super.allCategoryInstanceFuture, () {
      super.allCategoryInstanceFuture = value;
    });
  }

  late final _$opinionSubmitResponseFutureAtom = Atom(
      name: '_CategoryStore.opinionSubmitResponseFuture', context: context);

  @override
  ObservableFuture<OpinionSubmitResponse> get opinionSubmitResponseFuture {
    _$opinionSubmitResponseFutureAtom.reportRead();
    return super.opinionSubmitResponseFuture;
  }

  @override
  set opinionSubmitResponseFuture(
      ObservableFuture<OpinionSubmitResponse> value) {
    _$opinionSubmitResponseFutureAtom
        .reportWrite(value, super.opinionSubmitResponseFuture, () {
      super.opinionSubmitResponseFuture = value;
    });
  }

  late final _$opinionSubmittedResponseFutureAtom = Atom(
      name: '_CategoryStore.opinionSubmittedResponseFuture', context: context);

  @override
  ObservableFuture<SecondOpinionSubmittedResponse>
      get opinionSubmittedResponseFuture {
    _$opinionSubmittedResponseFutureAtom.reportRead();
    return super.opinionSubmittedResponseFuture;
  }

  @override
  set opinionSubmittedResponseFuture(
      ObservableFuture<SecondOpinionSubmittedResponse> value) {
    _$opinionSubmittedResponseFutureAtom
        .reportWrite(value, super.opinionSubmittedResponseFuture, () {
      super.opinionSubmittedResponseFuture = value;
    });
  }

  late final _$opinionSubmittedDetailResponseFutureAtom = Atom(
      name: '_CategoryStore.opinionSubmittedDetailResponseFuture',
      context: context);

  @override
  ObservableFuture<SubmittedOpinionDetailResponse>
      get opinionSubmittedDetailResponseFuture {
    _$opinionSubmittedDetailResponseFutureAtom.reportRead();
    return super.opinionSubmittedDetailResponseFuture;
  }

  @override
  set opinionSubmittedDetailResponseFuture(
      ObservableFuture<SubmittedOpinionDetailResponse> value) {
    _$opinionSubmittedDetailResponseFutureAtom
        .reportWrite(value, super.opinionSubmittedDetailResponseFuture, () {
      super.opinionSubmittedDetailResponseFuture = value;
    });
  }

  late final _$allCategoryListAtom =
      Atom(name: '_CategoryStore.allCategoryList', context: context);

  @override
  AllCategoryList? get allCategoryList {
    _$allCategoryListAtom.reportRead();
    return super.allCategoryList;
  }

  @override
  set allCategoryList(AllCategoryList? value) {
    _$allCategoryListAtom.reportWrite(value, super.allCategoryList, () {
      super.allCategoryList = value;
    });
  }

  late final _$sliderImageResponseAtom =
      Atom(name: '_CategoryStore.sliderImageResponse', context: context);

  @override
  AllSliderImageResponse? get sliderImageResponse {
    _$sliderImageResponseAtom.reportRead();
    return super.sliderImageResponse;
  }

  @override
  set sliderImageResponse(AllSliderImageResponse? value) {
    _$sliderImageResponseAtom.reportWrite(value, super.sliderImageResponse, () {
      super.sliderImageResponse = value;
    });
  }

  late final _$categoryInstanceResponseAtom =
      Atom(name: '_CategoryStore.categoryInstanceResponse', context: context);

  @override
  CategoryInstanceResponse? get categoryInstanceResponse {
    _$categoryInstanceResponseAtom.reportRead();
    return super.categoryInstanceResponse;
  }

  @override
  set categoryInstanceResponse(CategoryInstanceResponse? value) {
    _$categoryInstanceResponseAtom
        .reportWrite(value, super.categoryInstanceResponse, () {
      super.categoryInstanceResponse = value;
    });
  }

  late final _$opinionSubmitResponseAtom =
      Atom(name: '_CategoryStore.opinionSubmitResponse', context: context);

  @override
  OpinionSubmitResponse? get opinionSubmitResponse {
    _$opinionSubmitResponseAtom.reportRead();
    return super.opinionSubmitResponse;
  }

  @override
  set opinionSubmitResponse(OpinionSubmitResponse? value) {
    _$opinionSubmitResponseAtom.reportWrite(value, super.opinionSubmitResponse,
        () {
      super.opinionSubmitResponse = value;
    });
  }

  late final _$opinionSubmittedResponseAtom =
      Atom(name: '_CategoryStore.opinionSubmittedResponse', context: context);

  @override
  SecondOpinionSubmittedResponse? get opinionSubmittedResponse {
    _$opinionSubmittedResponseAtom.reportRead();
    return super.opinionSubmittedResponse;
  }

  @override
  set opinionSubmittedResponse(SecondOpinionSubmittedResponse? value) {
    _$opinionSubmittedResponseAtom
        .reportWrite(value, super.opinionSubmittedResponse, () {
      super.opinionSubmittedResponse = value;
    });
  }

  late final _$opinionSubmittedDetailResponseAtom = Atom(
      name: '_CategoryStore.opinionSubmittedDetailResponse', context: context);

  @override
  SubmittedOpinionDetailResponse? get opinionSubmittedDetailResponse {
    _$opinionSubmittedDetailResponseAtom.reportRead();
    return super.opinionSubmittedDetailResponse;
  }

  @override
  set opinionSubmittedDetailResponse(SubmittedOpinionDetailResponse? value) {
    _$opinionSubmittedDetailResponseAtom
        .reportWrite(value, super.opinionSubmittedDetailResponse, () {
      super.opinionSubmittedDetailResponse = value;
    });
  }

  late final _$getAllCategoriesAsyncAction =
      AsyncAction('_CategoryStore.getAllCategories', context: context);

  @override
  Future<dynamic> getAllCategories() {
    return _$getAllCategoriesAsyncAction.run(() => super.getAllCategories());
  }

  late final _$getSliderImagesAsyncAction =
      AsyncAction('_CategoryStore.getSliderImages', context: context);

  @override
  Future<dynamic> getSliderImages() {
    return _$getSliderImagesAsyncAction.run(() => super.getSliderImages());
  }

  late final _$getFilteredCategoriesAsyncAction =
      AsyncAction('_CategoryStore.getFilteredCategories', context: context);

  @override
  Future<dynamic> getFilteredCategories(String searchText) {
    return _$getFilteredCategoriesAsyncAction
        .run(() => super.getFilteredCategories(searchText));
  }

  late final _$getFormByCategoryAsyncAction =
      AsyncAction('_CategoryStore.getFormByCategory', context: context);

  @override
  Future<dynamic> getFormByCategory(int catId) {
    return _$getFormByCategoryAsyncAction
        .run(() => super.getFormByCategory(catId));
  }

  late final _$submitSecondOpinionAsyncAction =
      AsyncAction('_CategoryStore.submitSecondOpinion', context: context);

  @override
  Future<dynamic> submitSecondOpinion(OpinionSubmitRequest request) {
    return _$submitSecondOpinionAsyncAction
        .run(() => super.submitSecondOpinion(request));
  }

  late final _$getSecondOpinionSubmittedListAsyncAction = AsyncAction(
      '_CategoryStore.getSecondOpinionSubmittedList',
      context: context);

  @override
  Future<dynamic> getSecondOpinionSubmittedList(
      String? searchString, String? sort, String? userName) {
    return _$getSecondOpinionSubmittedListAsyncAction.run(() =>
        super.getSecondOpinionSubmittedList(searchString, sort, userName));
  }

  late final _$getSecondOpinionSubmittedDetailAsyncAction = AsyncAction(
      '_CategoryStore.getSecondOpinionSubmittedDetail',
      context: context);

  @override
  Future<dynamic> getSecondOpinionSubmittedDetail(String? id) {
    return _$getSecondOpinionSubmittedDetailAsyncAction
        .run(() => super.getSecondOpinionSubmittedDetail(id));
  }

  @override
  String toString() {
    return '''
allCategoryFuture: ${allCategoryFuture},
sliderImagesFuture: ${sliderImagesFuture},
allCategoryInstanceFuture: ${allCategoryInstanceFuture},
opinionSubmitResponseFuture: ${opinionSubmitResponseFuture},
opinionSubmittedResponseFuture: ${opinionSubmittedResponseFuture},
opinionSubmittedDetailResponseFuture: ${opinionSubmittedDetailResponseFuture},
allCategoryList: ${allCategoryList},
sliderImageResponse: ${sliderImageResponse},
categoryInstanceResponse: ${categoryInstanceResponse},
opinionSubmitResponse: ${opinionSubmitResponse},
opinionSubmittedResponse: ${opinionSubmittedResponse},
opinionSubmittedDetailResponse: ${opinionSubmittedDetailResponse},
isAllCategoriesInProcess: ${isAllCategoriesInProcess},
isCategoriesInstanceInProcess: ${isCategoriesInstanceInProcess},
isSubmittedDetailInstanceInProcess: ${isSubmittedDetailInstanceInProcess}
    ''';
  }
}
