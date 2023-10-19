import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:quraan_app/core/services/api_service.dart';
import 'package:quraan_app/features/home/data/repo/home_repo_imp.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImp>(HomeRepoImp(getIt.get<ApiService>()));
}
