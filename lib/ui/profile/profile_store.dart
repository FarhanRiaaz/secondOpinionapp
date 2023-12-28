import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import 'package:second_opinion_app/models/profile/sub_profile_request.dart';
import 'package:second_opinion_app/models/profile/sub_profile_response.dart';

import '../../data/repository/repository.dart';
import '../../models/profile/profile_response.dart';
import '../../models/profile/sub_profile_list.dart';

part 'profile_store.g.dart';

class ProfileStore = _ProfileStore with _$ProfileStore;

abstract class _ProfileStore with Store {
  final Repository _repository;

  // empty responses:-----------------------------------------------------------
  static ObservableFuture<ProfileResponse> emptyProfileResponse =
      ObservableFuture.value(ProfileResponse());
  static ObservableFuture<SubProfileList> emptySubProfileResponse =
      ObservableFuture.value(SubProfileList());
  static ObservableFuture<SubProfileResponse> emptyAddSubProfileResponse =
      ObservableFuture.value(SubProfileResponse());
  static ObservableFuture<bool> emptyDeleteSubProfileResponse =
      ObservableFuture.value(false);

  @observable
  ObservableFuture<ProfileResponse> profileFuture = emptyProfileResponse;

  @observable
  ObservableFuture<SubProfileList> subProfileFuture = emptySubProfileResponse;
  @observable
  ObservableFuture<bool> deleteSubUserFuture = emptyDeleteSubProfileResponse;

  @observable
  ObservableFuture<SubProfileResponse> addSubProfileFuture =
      emptyAddSubProfileResponse;
  @observable
  ObservableFuture<SubProfileResponse> updateSubProfileFuture =
      emptyAddSubProfileResponse;

  @observable
  ProfileResponse? currentUserProfile;

  @observable
  SubProfileResponse? currentAddSubUserProfile;

  @observable
  SubProfileRequest? subProfileRequest;

  @observable
  bool? isSubUserDeleted;

  @observable
  SubProfileList? currentSubUserProfile;

  @computed
  bool get isProfileInProcess => profileFuture.status == FutureStatus.pending;

  @computed
  bool get isSubProfileAddInProcess =>
      addSubProfileFuture.status == FutureStatus.pending;

  @computed
  bool get isUpdateSubProfileAddInProcess =>
      updateSubProfileFuture.status == FutureStatus.pending;

  @computed
  bool get isSubProfileInProcess =>
      subProfileFuture.status == FutureStatus.pending;

  @action
  String? getColorFromName(String userName) {
    String color = '000000';

    if (currentSubUserProfile!.subProfile!.length > 0) {
      for (SubProfileResponse items in currentSubUserProfile!.subProfile!) {
        if (items.name!.contains(userName)) {
          color = items.color!;
        }
      }
    }

    return color;
  }

  @action
  Future getProfile() async {
    final future = _repository.getProfile();
    profileFuture = ObservableFuture(future);
    await future.then((value) async {
      if (value.id != null) {
        currentUserProfile = value;
      } else {
        print('failed to login\nInvalid creds are provided!');
      }
    }).catchError((e) {
      print(e);

      print('failed to login\nInvalid creds are provided!\n${e.toString()}');
      throw e;
    });
  }

  @action
  Future getSubUserProfiles() async {
    final future = _repository.getSubUserProfile();
    subProfileFuture = ObservableFuture(future);
    await future.then((value) async {
      if (value.subProfile != null) {
        // currentSubUserProfile!.subProfile!=[];

        currentSubUserProfile = value;
        currentSubUserProfile!.subProfile!.add(SubProfileResponse(
            name: currentUserProfile!.name,
            profileImg: currentUserProfile!.profileImg,
            gender: currentUserProfile!.gender,

            relationShip: 'Self',
            color: '000000'));
      } else {
        print('failed to getSubUserProfile\nSomething went wrong!');
      }
    }).catchError((e) {
      print(e);

      print(
          'failed to getSubUserProfile\nSomething went wrong!\n${e.toString()}');
      throw e;
    });
  }

  @action
  Future addSubUserProfile() async {
    final future =
        _repository.addSubUserProfile(subProfileRequest ?? SubProfileRequest());
    addSubProfileFuture = ObservableFuture(future);
    await future.then((value) async {
      if (value != null) {
        currentAddSubUserProfile = value;
        getSubUserProfiles();
      } else {
        print('failed to addSubUserProfile\nSomething went wrong!');
      }
    }).catchError((e) {
      print(e);

      print(
          'failed to addSubUserProfile\nSomething went wrong!\n${e.toString()}');
      throw e;
    });
  }

  @action
  Future updateSubUserProfile(String subUserId) async {
    final future = _repository.updateSubUserProfile(
        subProfileRequest ?? SubProfileRequest(), subUserId);
    updateSubProfileFuture = ObservableFuture(future);
    await future.then((value) async {
      if (value != null) {
        currentAddSubUserProfile = value;
        getSubUserProfiles();
      } else {
        print('failed to updateSubUserProfile\nSomething went wrong!');
      }
    }).catchError((e) {
      print(e);

      print(
          'failed to updateSubUserProfile\nSomething went wrong!\n${e.toString()}');
      throw e;
    });
  }

  /// method to delete Sub User Profile via api just pass the user id currentDocumentToDelete just check the response of isDocumentDeleted
  @action
  Future deleteSubUserProfile(int subUserId) async {
    final future = _repository.deleteSubUserProfile(subUserId);
    deleteSubUserFuture = ObservableFuture(future);
    await future.then((value) async {
      if (value) {
        isSubUserDeleted = value;
        await getSubUserProfiles();
      } else {
        print('failed to deleteSubUserProfile\nSomething went wrong');
      }
    }).catchError((e) {
      print(e);

      print(
          'failed to deleteSubUserProfile\nSomething went wrong!\n${e.toString()}');
      throw e;
    });
  }

  @action
  Future updateProfile(String gender, int age, File? profileImage) async {
    final future =
        _repository.updateProfile(currentUserProfile!, profileImage ?? null);
    profileFuture = ObservableFuture(future);
    await future.then((value) async {
      if (value.id != null) {
        currentUserProfile = value;
      } else {
        print('failed to updateProfile\nData not found!');
      }
    }).catchError((e) {
      print(e);

      print('failed to updateProfile\nSomething went wrong!\n${e.toString()}');
      throw e;
    });
  }

  _ProfileStore(
    Repository repository,
  ) : this._repository = repository {}
}
