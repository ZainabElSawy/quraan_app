import 'package:get_it/get_it.dart';
import 'package:quraan_app/features/home/data/repo/home_repository/home_repo_imp.dart';

import '../../features/home/data/repo/quran_repository/quran_repo_imp.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<HomeRepoImp>(HomeRepoImp());
  getIt.registerSingleton<QuranRepoImp>(QuranRepoImp());
}
