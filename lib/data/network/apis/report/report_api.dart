import 'dart:io';

import 'package:dio/dio.dart';
import 'package:second_opinion_app/models/report/get_all_document_response.dart';
import 'package:second_opinion_app/models/report/get_report_type_response.dart';
import 'package:second_opinion_app/models/report/upload_report_response.dart';

import '../../constants/endpoints.dart';
import '../../dio_client.dart';

class ReportApi {
  // dio instance
  final DioClient _dioClient;

  // injecting dio instance
  ReportApi(this._dioClient);

  // method to upload documents
  Future<UploadReportResponse> uploadDocument(String fileName, String fileType, File documentFile, int? userId, String token) async {
    try {
      FormData formData = FormData.fromMap({
        'fileName': fileName,
        'type': fileType,
        'file': await MultipartFile.fromFile(documentFile.path, filename: documentFile.path),
        if(userId!=null)'userId': userId,
      });
      print(documentFile.path);
      final res = await _dioClient.post(
        Endpoints.documents,
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Token $token',
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      if (res != null) {
        return UploadReportResponse.fromJson(res);
      } else {
        throw Exception("Null response received!");
      }
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  //todo imp farhan here to look after the response type here

  // method to get filtered documents
  Future<GetAllDocumentResponse> getFilteredDocumentList(
      String sortFilter, String userName, String reportType, String token, String searchText) async {
    try {
      final res = await _dioClient.get(
        "${Endpoints.filteredDocuments}&sort=$sortFilter&user=$userName&type=$reportType&search=$searchText",
        options: Options(
          headers: {
            'Authorization': 'Token $token',
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      if (res != null) {
        return GetAllDocumentResponse.fromJson(res);
      } else {
        throw Exception("Null response received!");
      }
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  // method to get all documents list
  Future<GetAllDocumentResponse> getAllDocumentList(String token) async {
    try {
      final res = await _dioClient.get(
        Endpoints.documents,
        options: Options(
          headers: {
            'Authorization': 'Token $token',
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      if (res != null) {
        return GetAllDocumentResponse.fromJson(res);
      } else {
        throw Exception("Null response received!");
      }
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }


  // method to get delete a documents
  Future<bool> deleteDocument(String token, int id) async {
    try {
      final res = await _dioClient.delete(
        "${Endpoints.documents}$id/",
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
  // method to get all documents types
  Future<AllReportTypeResponse> getAllDocumentTypes(String token) async {
    try {
      final res = await _dioClient.get(
        Endpoints.getReportTypes,
        options: Options(
          headers: {
            'Authorization': 'Token $token',
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      if (res != null) {
        return AllReportTypeResponse.fromJson(res);
      } else {
        throw Exception("Null response received!");
      }
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
}
