import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quraan_app/core/dependency_injection/service_locator.dart';
import 'package:quraan_app/features/auth/presentation/views/pages/auth_view.dart';
import 'package:quraan_app/features/home/data/repo/quran_repository/quran_repo_imp.dart';
import 'package:quraan_app/features/home/presentation/view_models/home_cubit/home_cubit.dart';
import 'package:quraan_app/features/home/presentation/view_models/quran_cubits/surah_cubit/surah_cubit.dart';
import 'package:quraan_app/features/home/presentation/views/pages/azkar_details_view.dart';
import 'package:quraan_app/features/home/presentation/views/pages/home_view.dart';
import 'package:quraan_app/features/home/presentation/views/pages/surah_view.dart';
import 'package:quraan_app/features/splash/presentation/views/splash_view.dart';
import 'package:quraan_app/main.dart';

import '../../features/home/data/repo/azkar_repository/azkar_repo_imp.dart';
import '../../features/home/presentation/view_models/azkar_cubit/azkar_details_cubit/azkar_details_cubit.dart';

abstract class AppRouter {
  static const String kAuthView = "/authView";
  static const String kHomeView = "/homeView";
  static const String kSurahView = "/surahView";
  static const String kAzkarDetailsView = "/azkarDetailsView";
  static final route = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => sharedPreferences?.getString("uid") == null
            ? const SplashView()
            : BlocProvider(
                create: (context) => HomeCubit(),
                child: const HomeView(),
              ),
      ),
      GoRoute(
        path: kAuthView,
        builder: (context, state) => const AuthView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => BlocProvider(
          create: (context) => HomeCubit(),
          child: const HomeView(),
        ),
      ),
      GoRoute(
        path: kSurahView,
        builder: (context, state) => BlocProvider(
          create: (context) => SurahCubit(getIt.get<QuranRepoImpl>())
            ..fetchSurah(numberOfSurah: state.extra as int),
          child: const SurahView(),
        ),
      ),
      GoRoute(
        path: kAzkarDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => AzkarDetailsCubit(getIt.get<AzkarRepoImp>())
            ..fetchAzkarDetails(id: state.extra as int),
          child: const AzkarDetailsView(),
        ),
      ),
    ],
  );
}
