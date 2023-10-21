import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quraan_app/features/auth/presentation/views/pages/auth_view.dart';
import 'package:quraan_app/features/home/data/repo/quran_repository/quran_repo_imp.dart';
import 'package:quraan_app/features/home/presentation/view_models/home_cubit/home_cubit.dart';
import 'package:quraan_app/features/home/presentation/view_models/quran_cubits/surah_cubit/surah_cubit.dart';
import 'package:quraan_app/features/home/presentation/views/pages/home_view.dart';
import 'package:quraan_app/features/home/presentation/views/pages/surah_view.dart';
import 'package:quraan_app/features/splash/presentation/views/splash_view.dart';
import 'package:quraan_app/main.dart';

abstract class AppRouter {
  static const String kAuthView = "/authView";
  static const String kHomeView = "/homeView";
  static const String kBookDetailsView = "/bookDetailsView";
  static const String kSearchView = "/searchView";
  static const String kSurahView = "/surahView";
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
          create: (context) => SurahCubit(QuranRepoImp())..fetchSurah(numberOfSurah: state.extra as int),
          child: const SurahView(),
        ),
      ),
    ],
  );
}
