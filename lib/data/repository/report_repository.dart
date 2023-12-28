import 'dart:io';

import 'package:second_opinion_app/models/report/get_all_document_response.dart';
import 'package:second_opinion_app/models/report/get_report_type_response.dart';
import 'package:second_opinion_app/models/report/upload_report_response.dart';

import '../network/apis/report/report_api.dart';
import '../sharedpref/shared_preference_helper.dart';

class ReportRepository {
  // api objects
  final ReportApi _reportApi;

  // shared pref object
  final SharedPreferenceHelper _sharedPrefsHelper;

  // constructor
  ReportRepository(this._reportApi, this._sharedPrefsHelper);

  Future<UploadReportResponse> uploadDocument(
    String fileName,
    String fileType,
    File documentFile,
    int? userId,
  ) async {
    final authToken = await _sharedPrefsHelper.authToken;
    print("uploadReport$authToken");
    return await _reportApi.uploadDocument(
        fileName, fileType, documentFile, userId, authToken!);
  }

  Future<GetAllDocumentResponse> getFilteredDocumentList(
      String sortFilter,
      String userName, String reportType,String searchText
      ) async {
    final authToken = await _sharedPrefsHelper.authToken;
    print("getFilteredDocumentList$authToken");
    return await _reportApi.getFilteredDocumentList(
        sortFilter, userName, reportType, authToken!,searchText);
  }



  Future<GetAllDocumentResponse> getAllDocumentList(
      ) async {
    final authToken = await _sharedPrefsHelper.authToken;
    print("getAllDocumentList$authToken");
    return await _reportApi.getAllDocumentList(authToken!);
  }

  Future<bool> deleteDocument(
      int id) async {
    final authToken = await _sharedPrefsHelper.authToken;
    print("deleteDocument$authToken");
    return await _reportApi.deleteDocument(authToken!,id);
  }
  Future<AllReportTypeResponse> getAllDocumentTypes() async {
    final authToken = await _sharedPrefsHelper.authToken;
    print("getAllDocumentList$authToken");
    return await _reportApi.getAllDocumentTypes(authToken!);
  }

  Future<String?> get authToken async => await _sharedPrefsHelper.authToken;
}
