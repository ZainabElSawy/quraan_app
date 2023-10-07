import 'package:flutter/material.dart';
import 'package:quraan_app/features/auth/presentation/views/widgets/login_body.dart';
import 'package:quraan_app/features/auth/presentation/views/widgets/signup_body.dart';

class CustomTabBarView extends StatelessWidget {
  const CustomTabBarView({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: _tabController,
      children: const [
        LoginBody(),
        SignUpBody(),
      ],
    );
  }

  }

