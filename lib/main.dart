import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quraan_app/core/constants/app_router.dart';
import 'package:quraan_app/core/constants/app_theme.dart';
import 'package:quraan_app/core/dependency_injection/service_locator.dart';
import 'package:quraan_app/features/auth/data/repos/auth_repo_imp.dart';
import 'package:quraan_app/features/auth/presentation/view_models/auth_cubit/auth_cubit.dart';
import 'package:quraan_app/features/auth/presentation/view_models/login_cubit/login_cubit.dart';
import 'package:quraan_app/features/auth/presentation/view_models/sign_with_facebook_cubit/cubit/sign_with_face_book_cubit.dart';
import 'package:quraan_app/features/auth/presentation/view_models/signup_cubits/signup_cubit/sign_up_cubit.dart';
import 'package:quraan_app/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? sharedPreferences;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  setupServiceLocator();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const QuraanApp());
}

class QuraanApp extends StatelessWidget {
  const QuraanApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(
          create: (context) => SignUpCubit(getIt.get<AuthRepoImp>()),
        ),
        BlocProvider(
          create: (context) => LoginCubit(getIt.get<AuthRepoImp>()),
        ),
        BlocProvider(
          create: (context) => SignWithFaceBookCubit(getIt.get<AuthRepoImp>()),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.route,
        debugShowCheckedModeBanner: false,
        theme: appTheme,
      ),
    );
  }
}
