import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quraan_app/core/constants/app_router.dart';
import 'package:quraan_app/core/constants/assets.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    navigateToAuth();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Image.asset(
                AssetsData.logo,
                width: MediaQuery.of(context).size.width * 0.55,
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void navigateToAuth() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        GoRouter.of(context).push(AppRouter.kAuthView);
      },
    );
  }
}
