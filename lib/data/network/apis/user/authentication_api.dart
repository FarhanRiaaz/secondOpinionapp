import 'package:dio/dio.dart';
import 'package:second_opinion_app/data/network/dio_client.dart';
import 'package:second_opinion_app/data/network/rest_client.dart';
import 'package:second_opinion_app/models/authentication/login_request.dart';
import 'package:second_opinion_app/models/authentication/login_user_response.dart';
import 'package:second_opinion_app/models/authentication/register_user_response.dart';
import 'package:second_opinion_app/models/authentication/registration_request.dart';

import '../../constants/endpoints.dart';

class AuthenticationApi {
  // dio instance
  final DioClient _dioClient;

  // rest-client instance
  final RestClient _restClient;

  // injecting dio instance
  AuthenticationApi(this._dioClient, this._restClient);

  /// Method to registerUser it will return with a complete model or with a single item

  Future<RegisterUserResponse> registerUser(RegistrationRequest registerRequest) async {
    try {
      FormData formData = FormData.fromMap(registerRequest.toJson());

      final res = await _dioClient.post(
        Endpoints.register,
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      if (res != null) {
        return RegisterUserResponse.fromJson(res);
      } else {
        throw Exception("Null response received!");
      }
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  /// method to login user it will respond with token otherwise with an error
  Future<LoginUserResponse> loginUser(LoginRequest request) async {
    try {
      FormData formData = FormData.fromMap({
        'email': request.email,
        'password': request.password,
      });

      final res = await _dioClient.post(
        Endpoints.login,
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      if (res != null) {
        return LoginUserResponse.fromJson(res);
      } else {
        throw Exception("Null response received!");
      }
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
}
