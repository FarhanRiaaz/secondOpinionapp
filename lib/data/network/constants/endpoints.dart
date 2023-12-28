class Endpoints {
  Endpoints._();

  // base url
 // static const String baseUrl = "https://sop.zpexsolutions.com/patient-app/api";

  static const String baseUrl = "https://backend.h3lth.net/patient-app/api";

  // receiveTimeout
  static const Duration receiveTimeout = Duration(milliseconds: 15000);

  // connectTimeout
  static const Duration connectionTimeout = Duration(milliseconds: 30000);

  // booking endpoints
  static const String register = baseUrl + "/register";
  static const String login = baseUrl + "/login";
  static const String logout = baseUrl + "/logout";
  static const String profile = baseUrl + "/profile";
  static const String documents = baseUrl + "/documents/";
  static const String filteredDocuments = baseUrl + "/documents/?search=";
  static const String subProfile = baseUrl + "/subprofiles/";
  static const String getFormByCatId = baseUrl + "/forms";
  static const String getHomeData = baseUrl + "/home";
  static const String getCategories = baseUrl + "/categories/";
  static const String submitSecondOpinion = baseUrl + "/submit-request/";
  static const String getSecondOpinionSubmittedList = baseUrl + "/requests/";
  static const String getSecondOpinionSubmittedDetail = baseUrl + "/requests/";
  static const String getFilteredCategories = baseUrl + "/categories/?search=";
  static const String uploadDocument = baseUrl + "/request/upload-document/";
  static const String getSliderImages = baseUrl + "/slider";
  static const String getReportTypes = baseUrl + "/types";
}
