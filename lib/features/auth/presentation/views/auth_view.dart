import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quraan_app/features/auth/presentation/view_models/auth_cubit/auth_cubit.dart';
import 'package:quraan_app/features/auth/presentation/views/widgets/custom_tab_bar.dart';
import 'package:quraan_app/features/auth/presentation/views/widgets/custom_tab_bar_view.dart';
import 'package:quraan_app/features/auth/presentation/views/widgets/logo_widget.dart';

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
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    if (state is LoginState) {
                      return SizedBox(
                          height: MediaQuery.of(context).size.height * 0.2);
                    } else if (state is SignupState) {
                      return SizedBox(
                          height: MediaQuery.of(context).size.height * 0.10);
                    } else {
                      return Container();
                    }
                  },
                ),
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
        ),
      ),
    );
  }
}
