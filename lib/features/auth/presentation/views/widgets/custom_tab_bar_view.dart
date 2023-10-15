import 'package:flutter/material.dart';
import 'package:quraan_app/features/auth/presentation/views/pages/login_view.dart';
import 'package:quraan_app/features/auth/presentation/views/pages/signup_view.dart';

class CustomTabBarView extends StatelessWidget {
  const CustomTabBarView({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      physics: const NeverScrollableScrollPhysics(),
      controller: _tabController,
      children: [
        LoginBody(),
        SignUpBody(),
      ],
    );
  }
}
