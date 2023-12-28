// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfileStore on _ProfileStore, Store {
  Computed<bool>? _$isProfileInProcessComputed;

  @override
  bool get isProfileInProcess => (_$isProfileInProcessComputed ??=
          Computed<bool>(() => super.isProfileInProcess,
              name: '_ProfileStore.isProfileInProcess'))
      .value;
  Computed<bool>? _$isSubProfileAddInProcessComputed;

  @override
  bool get isSubProfileAddInProcess => (_$isSubProfileAddInProcessComputed ??=
          Computed<bool>(() => super.isSubProfileAddInProcess,
              name: '_ProfileStore.isSubProfileAddInProcess'))
      .value;
  Computed<bool>? _$isUpdateSubProfileAddInProcessComputed;

  @override
  bool get isUpdateSubProfileAddInProcess =>
      (_$isUpdateSubProfileAddInProcessComputed ??= Computed<bool>(
              () => super.isUpdateSubProfileAddInProcess,
              name: '_ProfileStore.isUpdateSubProfileAddInProcess'))
          .value;
  Computed<bool>? _$isSubProfileInProcessComputed;

  @override
  bool get isSubProfileInProcess => (_$isSubProfileInProcessComputed ??=
          Computed<bool>(() => super.isSubProfileInProcess,
              name: '_ProfileStore.isSubProfileInProcess'))
      .value;

  late final _$profileFutureAtom =
      Atom(name: '_ProfileStore.profileFuture', context: context);

  @override
  ObservableFuture<ProfileResponse> get profileFuture {
    _$profileFutureAtom.reportRead();
    return super.profileFuture;
  }

  @override
  set profileFuture(ObservableFuture<ProfileResponse> value) {
    _$profileFutureAtom.reportWrite(value, super.profileFuture, () {
      super.profileFuture = value;
    });
  }

  late final _$subProfileFutureAtom =
      Atom(name: '_ProfileStore.subProfileFuture', context: context);

  @override
  ObservableFuture<SubProfileList> get subProfileFuture {
    _$subProfileFutureAtom.reportRead();
    return super.subProfileFuture;
  }

  @override
  set subProfileFuture(ObservableFuture<SubProfileList> value) {
    _$subProfileFutureAtom.reportWrite(value, super.subProfileFuture, () {
      super.subProfileFuture = value;
    });
  }

  late final _$deleteSubUserFutureAtom =
      Atom(name: '_ProfileStore.deleteSubUserFuture', context: context);

  @override
  ObservableFuture<bool> get deleteSubUserFuture {
    _$deleteSubUserFutureAtom.reportRead();
    return super.deleteSubUserFuture;
  }

  @override
  set deleteSubUserFuture(ObservableFuture<bool> value) {
    _$deleteSubUserFutureAtom.reportWrite(value, super.deleteSubUserFuture, () {
      super.deleteSubUserFuture = value;
    });
  }

  late final _$addSubProfileFutureAtom =
      Atom(name: '_ProfileStore.addSubProfileFuture', context: context);

  @override
  ObservableFuture<SubProfileResponse> get addSubProfileFuture {
    _$addSubProfileFutureAtom.reportRead();
    return super.addSubProfileFuture;
  }

  @override
  set addSubProfileFuture(ObservableFuture<SubProfileResponse> value) {
    _$addSubProfileFutureAtom.reportWrite(value, super.addSubProfileFuture, () {
      super.addSubProfileFuture = value;
    });
  }

  late final _$updateSubProfileFutureAtom =
      Atom(name: '_ProfileStore.updateSubProfileFuture', context: context);

  @override
  ObservableFuture<SubProfileResponse> get updateSubProfileFuture {
    _$updateSubProfileFutureAtom.reportRead();
    return super.updateSubProfileFuture;
  }

  @override
  set updateSubProfileFuture(ObservableFuture<SubProfileResponse> value) {
    _$updateSubProfileFutureAtom
        .reportWrite(value, super.updateSubProfileFuture, () {
      super.updateSubProfileFuture = value;
    });
  }

  late final _$currentUserProfileAtom =
      Atom(name: '_ProfileStore.currentUserProfile', context: context);

  @override
  ProfileResponse? get currentUserProfile {
    _$currentUserProfileAtom.reportRead();
    return super.currentUserProfile;
  }

  @override
  set currentUserProfile(ProfileResponse? value) {
    _$currentUserProfileAtom.reportWrite(value, super.currentUserProfile, () {
      super.currentUserProfile = value;
    });
  }

  late final _$currentAddSubUserProfileAtom =
      Atom(name: '_ProfileStore.currentAddSubUserProfile', context: context);

  @override
  SubProfileResponse? get currentAddSubUserProfile {
    _$currentAddSubUserProfileAtom.reportRead();
    return super.currentAddSubUserProfile;
  }

  @override
  set currentAddSubUserProfile(SubProfileResponse? value) {
    _$currentAddSubUserProfileAtom
        .reportWrite(value, super.currentAddSubUserProfile, () {
      super.currentAddSubUserProfile = value;
    });
  }

  late final _$subProfileRequestAtom =
      Atom(name: '_ProfileStore.subProfileRequest', context: context);

  @override
  SubProfileRequest? get subProfileRequest {
    _$subProfileRequestAtom.reportRead();
    return super.subProfileRequest;
  }

  @override
  set subProfileRequest(SubProfileRequest? value) {
    _$subProfileRequestAtom.reportWrite(value, super.subProfileRequest, () {
      super.subProfileRequest = value;
    });
  }

  late final _$isSubUserDeletedAtom =
      Atom(name: '_ProfileStore.isSubUserDeleted', context: context);

  @override
  bool? get isSubUserDeleted {
    _$isSubUserDeletedAtom.reportRead();
    return super.isSubUserDeleted;
  }

  @override
  set isSubUserDeleted(bool? value) {
    _$isSubUserDeletedAtom.reportWrite(value, super.isSubUserDeleted, () {
      super.isSubUserDeleted = value;
    });
  }

  late final _$currentSubUserProfileAtom =
      Atom(name: '_ProfileStore.currentSubUserProfile', context: context);

  @override
  SubProfileList? get currentSubUserProfile {
    _$currentSubUserProfileAtom.reportRead();
    return super.currentSubUserProfile;
  }

  @override
  set currentSubUserProfile(SubProfileList? value) {
    _$currentSubUserProfileAtom.reportWrite(value, super.currentSubUserProfile,
        () {
      super.currentSubUserProfile = value;
    });
  }

  late final _$getProfileAsyncAction =
      AsyncAction('_ProfileStore.getProfile', context: context);

  @override
  Future<dynamic> getProfile() {
    return _$getProfileAsyncAction.run(() => super.getProfile());
  }

  late final _$getSubUserProfilesAsyncAction =
      AsyncAction('_ProfileStore.getSubUserProfiles', context: context);

  @override
  Future<dynamic> getSubUserProfiles() {
    return _$getSubUserProfilesAsyncAction
        .run(() => super.getSubUserProfiles());
  }

  late final _$addSubUserProfileAsyncAction =
      AsyncAction('_ProfileStore.addSubUserProfile', context: context);

  @override
  Future<dynamic> addSubUserProfile() {
    return _$addSubUserProfileAsyncAction.run(() => super.addSubUserProfile());
  }

  late final _$updateSubUserProfileAsyncAction =
      AsyncAction('_ProfileStore.updateSubUserProfile', context: context);

  @override
  Future<dynamic> updateSubUserProfile(String subUserId) {
    return _$updateSubUserProfileAsyncAction
        .run(() => super.updateSubUserProfile(subUserId));
  }

  late final _$deleteSubUserProfileAsyncAction =
      AsyncAction('_ProfileStore.deleteSubUserProfile', context: context);

  @override
  Future<dynamic> deleteSubUserProfile(int subUserId) {
    return _$deleteSubUserProfileAsyncAction
        .run(() => super.deleteSubUserProfile(subUserId));
  }

  late final _$updateProfileAsyncAction =
      AsyncAction('_ProfileStore.updateProfile', context: context);

  @override
  Future<dynamic> updateProfile(String gender, int age, File? profileImage) {
    return _$updateProfileAsyncAction
        .run(() => super.updateProfile(gender, age, profileImage));
  }

  late final _$_ProfileStoreActionController =
      ActionController(name: '_ProfileStore', context: context);

  @override
  String? getColorFromName(String userName) {
    final _$actionInfo = _$_ProfileStoreActionController.startAction(
        name: '_ProfileStore.getColorFromName');
    try {
      return super.getColorFromName(userName);
    } finally {
      _$_ProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
profileFuture: ${profileFuture},
subProfileFuture: ${subProfileFuture},
deleteSubUserFuture: ${deleteSubUserFuture},
addSubProfileFuture: ${addSubProfileFuture},
updateSubProfileFuture: ${updateSubProfileFuture},
currentUserProfile: ${currentUserProfile},
currentAddSubUserProfile: ${currentAddSubUserProfile},
subProfileRequest: ${subProfileRequest},
isSubUserDeleted: ${isSubUserDeleted},
currentSubUserProfile: ${currentSubUserProfile},
isProfileInProcess: ${isProfileInProcess},
isSubProfileAddInProcess: ${isSubProfileAddInProcess},
isUpdateSubProfileAddInProcess: ${isUpdateSubProfileAddInProcess},
isSubProfileInProcess: ${isSubProfileInProcess}
    ''';
  }
}
