import 'package:flutter/material.dart';
import 'package:quraan_app/features/auth/presentation/views/widgets/custom_tab_bar.dart';
import 'package:quraan_app/features/auth/presentation/views/widgets/custom_tab_bar_view.dart';
import 'package:quraan_app/features/auth/presentation/views/widgets/logo_widget.dart';
import 'package:quraan_app/features/auth/presentation/views/widgets/spacing_in_top.dart';

class AuthView extends StatefulWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SpacingInTop(),
                    const LogoWidget(),
                    const SizedBox(height: 40),
                    CustomTabBar(tabController: _tabController),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.7,
                      child: CustomTabBarView(tabController: _tabController),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

