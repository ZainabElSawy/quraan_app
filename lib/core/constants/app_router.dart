
import 'package:go_router/go_router.dart';
import 'package:quraan_app/features/auth/presentation/views/auth_view.dart';
import 'package:quraan_app/features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const String kAuthView = "/authView";
  static const String kBookDetailsView = "/bookDetailsView";
  static const String kSearchView = "/searchView";
  static final route = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kAuthView,
        builder: (context, state) => const AuthView(),
      ),
      // GoRoute(
      //   path: kBookDetailsView,
      //   builder: (context, state) => BlocProvider(
      //     create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImp>()),
      //     child: BookDetailsView(book: state.extra as BookModel,),
      //   ),
      // ),
    ],
  );
}
