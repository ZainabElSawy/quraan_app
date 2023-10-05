import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quraan_app/core/constants/app_router.dart';
import 'package:quraan_app/core/constants/colors.dart';
import 'package:quraan_app/features/auth/presentation/view_models/auth_cubit/auth_cubit.dart';

void main() {
  runApp(const QuraanApp());
}

class QuraanApp extends StatelessWidget {
  const QuraanApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.route,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
          useMaterial3: true,
        ),
      ),
    );
  }
}
