import 'dart:io';

import 'package:dio/dio.dart';
import 'package:second_opinion_app/models/profile/sub_profile_list.dart';
import 'package:second_opinion_app/models/profile/sub_profile_response.dart';

import '../../../../models/profile/profile_response.dart';
import '../../../../models/profile/sub_profile_request.dart';
import '../../constants/endpoints.dart';
import '../../dio_client.dart';

class ProfileApi {
  // Dio instance
  final DioClient _dioClient;

  // Injecting Dio instance
  ProfileApi(this._dioClient);

  /// Method to get user profile
  Future<ProfileResponse> getUserProfile(String token) async {
    try {
      final res = await _dioClient.get(
        Endpoints.profile,
        options: Options(
          headers: {
            'Authorization': 'Token $token',
          },
        ),
      );
      if (res != null) {
        return ProfileResponse.fromJson(res);
      } else {
        print("Null response received!\ngetUserProfile()");
        return ProfileResponse();
      }
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  /// Method to update user profile
  Future<ProfileResponse> updateProfile(String token, File? profileImage, ProfileResponse currentProfile) async {
    try {
      String? fileName = profileImage?.path.split('/').last ?? null;

      FormData formData = FormData.fromMap({
        'gender': currentProfile.gender,
        'age': currentProfile.age,
        'weight': currentProfile.weight,
        'phone':currentProfile.phone,
        'height': currentProfile.height,
        'weight_unit': currentProfile.weightUnit,
        'height_unit': currentProfile.heightUnit,
        if (profileImage?.path != null) 'profileImg': await MultipartFile.fromFile(profileImage?.path ?? '', filename: fileName),
      });

      final res = await _dioClient.patch(
        Endpoints.profile,
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Token $token',
            'Content-Type': 'multipart/form-data',
          },
        ),
      );
      if (res != null) {
        return ProfileResponse.fromJson(res);
      } else {
        print("Null response received!\ngetUserProfile()");
        return ProfileResponse();
      }
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  /// Method to get sub profile
  Future<SubProfileList> getSubUserProfile(String token) async {
    try {
      final res = await _dioClient.get(
        Endpoints.subProfile,
        options: Options(
          headers: {
            'Authorization': 'Token $token',
          },
        ),
      );
      if (res != null) {
        return SubProfileList.fromJson(res);
      } else {
        print("Null response received!\ngetSubUserProfile()");
        return SubProfileList();
      }
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  /// Method to add sub profile
  Future<SubProfileResponse> addSubUserProfile(SubProfileRequest request, String token) async {
    try {
      FormData formData = FormData.fromMap({
        'name': request.name,
        'gender': request.gender,
        'age': request.age,
        'weight': request.weight,
        'color': request.color,
        'height': request.height,
        'height_unit': request.heightUnit,
        'weight_unit': request.weightUnit,
        'relation_ship': request.relationship,
        if (request.profileImg?.path != null) 'profileImg': await MultipartFile.fromFile(request.profileImg!.path),
      });
      print(formData.fields);
      final res = await _dioClient.post(
        Endpoints.subProfile,
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Token $token',
            'Content-Type': 'multipart/form-data',
          },
        ),
      );
      if (res != null) {
        return SubProfileResponse.fromJson(res);
      } else {
        print("Null response received!\naddSubUserProfile()");
        return SubProfileResponse();
      }
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  /// Method to update sub profile
  Future<SubProfileResponse> updateSubUserProfile(SubProfileRequest request, String userId, String token) async {
    try {
      FormData formData = FormData.fromMap({
        if (request.name != null) 'name': request.name,
        if (request.gender != null) 'gender': request.gender,
        if (request.age != null) 'age': request.age,
        if (request.weight != null) 'weight': request.weight,
        if (request.color != null) 'color': request.color,
        if (request.height != null) 'height': request.height,
        if (request.heightUnit != null) 'height_unit': request.heightUnit,
        if (request.weightUnit != null) 'weight_unit': request.weightUnit,
        if (request.relationship != null) 'relation_ship': request.relationship,
        if (request.profileImg?.path != null) 'profileImg': await MultipartFile.fromFile(request.profileImg!.path),
      });
      print(formData.fields);
      final res = await _dioClient.patch(
        "${Endpoints.subProfile}$userId/",
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Token $token',
            'Content-Type': 'multipart/form-data',
          },
        ),
      );
      if (res != null) {
        return SubProfileResponse.fromJson(res);
      } else {
        print("Null response received!\naddSubUserProfile()");
        return SubProfileResponse();
      }
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  /// Method to delete sub profile
  Future<bool> deleteSubUserProfile(String token, int userId) async {
    try {
      final res = await _dioClient.delete(
        "${Endpoints.subProfile}$userId/",
        options: Options(
          headers: {
            'Authorization': 'Token $token',
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      if (res == null) {
        return true;
      } else {
        print("Response: ${res['detail'].toString()}");
        return false;
        throw Exception("Null response received!");
      }
    } catch (e) {
      print(e.toString());
      return false;
      throw e;
    }
  }
}
