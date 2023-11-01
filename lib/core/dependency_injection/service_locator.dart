import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:quraan_app/features/home/data/data_sources/Azkar_datasource/azkar_datasource_impl.dart';
import 'package:quraan_app/features/home/data/repo/prayer_timings_repository/prayer_timings_repo_imp.dart';

import '../../features/auth/data/data_sources/auth_datasource_imp.dart';
import '../../features/auth/data/repos/auth_repo_imp.dart';
import '../../features/home/data/data_sources/prayer_timings_datasource/prayer_timings_datasource_imp.dart';
import '../../features/home/data/data_sources/quran_datasource/quran_datasource_imp.dart';
import '../../features/home/data/repo/azkar_repository/azkar_repo_imp.dart';
import '../../features/home/data/repo/quran_repository/quran_repo_imp.dart';
import '../services/api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  //Auth
  getIt.registerSingleton<AuthDataSourceImp>(AuthDataSourceImp());
  getIt.registerSingleton<AuthRepoImp>(
      AuthRepoImp(getIt.get<AuthDataSourceImp>()));
  //PrayerTimings_View
  getIt.registerSingleton<PrayerTimingsDataSourceImp>(
    PrayerTimingsDataSourceImp(
      ApiService(dio: Dio(), baseUrl: 'https://api.aladhan.com/v1/'),
    ),
  );
  getIt.registerSingleton<PrayerTimingsRepoImp>(
    PrayerTimingsRepoImp(
      getIt.get<PrayerTimingsDataSourceImp>(),
    ),
  );
  //Quran_View
  getIt.registerSingleton<QuranDataSourceImp>(
    QuranDataSourceImp(
      ApiService(dio: Dio(), baseUrl: 'http://api.alquran.cloud/v1/'),
    ),
  );
  getIt.registerSingleton<QuranRepoImpl>(
    QuranRepoImpl(
      getIt.get<QuranDataSourceImp>(),
    ),
  );
  //Azkar_View
  getIt.registerSingleton<AzkarDataSourceImp>(
    AzkarDataSourceImp(
        // ApiService(
        //   dio: Dio(),
        //   baseUrl: "https://raw.githubusercontent.com/nawafalqari/",
        // ),
        ),
  );
  getIt.registerSingleton<AzkarRepoImp>(
    AzkarRepoImp(getIt.get<AzkarDataSourceImp>()),
  );
}
