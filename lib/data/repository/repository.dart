import 'dart:async';
import 'dart:io';
import 'package:second_opinion_app/data/network/apis/profile/profile_api.dart';
import 'package:second_opinion_app/data/network/apis/user/authentication_api.dart';
import 'package:second_opinion_app/data/sharedpref/shared_preference_helper.dart';
import 'package:second_opinion_app/models/authentication/login_request.dart';
import 'package:second_opinion_app/models/authentication/login_user_response.dart';
import 'package:second_opinion_app/models/authentication/register_user_response.dart';
import 'package:second_opinion_app/models/authentication/registration_request.dart';
import 'package:second_opinion_app/models/profile/profile_response.dart';
import 'package:second_opinion_app/models/profile/sub_profile_request.dart';
import 'package:second_opinion_app/models/profile/sub_profile_response.dart';

import '../../models/profile/sub_profile_list.dart';

class Repository {
  // api objects
  final AuthenticationApi _authenticationApi;
  final ProfileApi _profileApi;

  // shared pref object
  final SharedPreferenceHelper _sharedPrefsHelper;

  // constructor
  Repository(this._authenticationApi, this._sharedPrefsHelper, this._profileApi);

  // Register:------------------------------------------------------------------

  Future<RegisterUserResponse> register(String name, String password, String email) async {
    return await _authenticationApi
        .registerUser(RegistrationRequest(
      name: name,
      email: email,
      password: password,
    ))
        .then((response) {
      if (response != null) {
        print("User registered");
        return response;
      } else {
        print("User already registered");
        return RegisterUserResponse();
      }
    });
  }

  // Login:---------------------------------------------------------------------
  Future<LoginUserResponse> login(String email, String password) async {
    return await _authenticationApi.loginUser(LoginRequest(email: email, password: password)).then((response) {
      if (response.token != null) {
        saveIsLoggedIn(true);
        saveAuthenticationToken(response.token!);
        return response;
      } else {
        return response;
      }
    });
  }

  Future<ProfileResponse> getProfile() async {
    final authToken = await _sharedPrefsHelper.authToken;
    print("getProfile$authToken");
    return await _profileApi.getUserProfile(authToken!);
  }

  Future<ProfileResponse> updateProfile(ProfileResponse currentProfile, File? profileImage) async {
    final authToken = await _sharedPrefsHelper.authToken;
    print("updateProfile$authToken");
    return await _profileApi.updateProfile(authToken!, profileImage, currentProfile);
  }

  Future<SubProfileList> getSubUserProfile() async {
    final authToken = await _sharedPrefsHelper.authToken;
    print("getSubUserProfile$authToken");
    return await _profileApi.getSubUserProfile(authToken!);
  }

  Future<SubProfileResponse> addSubUserProfile(SubProfileRequest request) async {
    final authToken = await _sharedPrefsHelper.authToken;
    print("getSubUserProfile$authToken");
    return await _profileApi.addSubUserProfile(request, authToken!);
  }

  Future<SubProfileResponse> updateSubUserProfile(SubProfileRequest request, String userId) async {
    final authToken = await _sharedPrefsHelper.authToken;
    print("updateSubUserProfile$authToken");
    return await _profileApi.updateSubUserProfile(request, userId, authToken!);
  }

  Future<bool> deleteSubUserProfile(int id) async {
    final authToken = await _sharedPrefsHelper.authToken;
    print("deleteSubUserProfile$authToken");
    return await _profileApi.deleteSubUserProfile(authToken!, id);
  }

  Future<void> saveIsLoggedIn(bool value) => _sharedPrefsHelper.saveIsLoggedIn(value);

  Future<void> saveAuthenticationToken(String value) => _sharedPrefsHelper.saveAuthToken(value);

  Future<bool> get isLoggedIn => _sharedPrefsHelper.isLoggedIn;

  Future<String?> get authToken async => await _sharedPrefsHelper.authToken;

  // Theme: --------------------------------------------------------------------
  Future<void> changeBrightnessToDark(bool value) => _sharedPrefsHelper.changeBrightnessToDark(value);

  bool get isDarkMode => _sharedPrefsHelper.isDarkMode;

  // Language: -----------------------------------------------------------------
  Future<void> changeLanguage(String value) => _sharedPrefsHelper.changeLanguage(value);

  String? get currentLanguage => _sharedPrefsHelper.currentLanguage;
}
