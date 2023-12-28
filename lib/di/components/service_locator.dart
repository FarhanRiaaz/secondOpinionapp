import 'package:second_opinion_app/data/local/datasources/post/post_datasource.dart';
import 'package:second_opinion_app/data/network/apis/category/catergory_api.dart';
import 'package:second_opinion_app/data/network/apis/posts/post_api.dart';
import 'package:second_opinion_app/data/network/apis/profile/profile_api.dart';
import 'package:second_opinion_app/data/network/apis/report/report_api.dart';
import 'package:second_opinion_app/data/network/dio_client.dart';
import 'package:second_opinion_app/data/network/rest_client.dart';
import 'package:second_opinion_app/data/repository/category_repository.dart';
import 'package:second_opinion_app/data/repository/repository.dart';
import 'package:second_opinion_app/data/sharedpref/shared_preference_helper.dart';
import 'package:second_opinion_app/di/module/local_module.dart';
import 'package:second_opinion_app/di/module/network_module.dart';
import 'package:second_opinion_app/stores/category/category_store.dart';
import 'package:second_opinion_app/stores/error/error_store.dart';
import 'package:second_opinion_app/stores/form/form_store.dart';
import 'package:second_opinion_app/stores/language/language_store.dart';
import 'package:second_opinion_app/stores/post/post_store.dart';
import 'package:second_opinion_app/stores/theme/theme_store.dart';
import 'package:second_opinion_app/stores/user/user_store.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:second_opinion_app/ui/profile/profile_store.dart';
import 'package:sembast/sembast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/network/apis/user/authentication_api.dart';
import '../../data/repository/report_repository.dart';
import '../../stores/report/report_store.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  // factories:-----------------------------------------------------------------
  getIt.registerFactory(() => ErrorStore());
  getIt.registerFactory(() => FormStore());

  // async singletons:----------------------------------------------------------
  getIt.registerSingletonAsync<Database>(() => LocalModule.provideDatabase());
  getIt.registerSingletonAsync<SharedPreferences>(
      () => LocalModule.provideSharedPreferences());

  // singletons:----------------------------------------------------------------
  getIt.registerSingleton(
      SharedPreferenceHelper(await getIt.getAsync<SharedPreferences>()));
  getIt.registerSingleton<Dio>(
      NetworkModule.provideDio(getIt<SharedPreferenceHelper>()));
  getIt.registerSingleton(DioClient(getIt<Dio>()));
  getIt.registerSingleton(RestClient());

  // api's:---------------------------------------------------------------------
  getIt.registerSingleton(PostApi(getIt<DioClient>(), getIt<RestClient>()));
  getIt.registerSingleton(
      AuthenticationApi(getIt<DioClient>(), getIt<RestClient>()));
  getIt.registerSingleton(ProfileApi(getIt<DioClient>()));
  getIt.registerSingleton(ReportApi(getIt<DioClient>()));
  getIt.registerSingleton(CategoryApi(getIt<DioClient>()));

  // data sources
  getIt.registerSingleton(PostDataSource(await getIt.getAsync<Database>()));

  // repository:----------------------------------------------------------------
  getIt.registerSingleton(Repository(getIt<AuthenticationApi>(),
      getIt<SharedPreferenceHelper>(), getIt<ProfileApi>()));

  getIt.registerSingleton(ReportRepository(
    getIt<ReportApi>(),
    getIt<SharedPreferenceHelper>(),
  ));

  getIt.registerSingleton(CategoryRepository(
    getIt<CategoryApi>(),
    getIt<SharedPreferenceHelper>(),
  ));

  // stores:--------------------------------------------------------------------
  getIt.registerSingleton(LanguageStore(getIt<Repository>()));
  getIt.registerSingleton(PostStore(getIt<Repository>()));
  getIt.registerSingleton(ThemeStore(getIt<Repository>()));
  getIt.registerSingleton(UserStore(getIt<Repository>()));
  getIt.registerSingleton(ProfileStore(getIt<Repository>()));
  getIt.registerSingleton(ReportStore(getIt<ReportRepository>()));
  getIt.registerSingleton(CategoryStore(getIt<CategoryRepository>()));
}
