import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quraan_app/core/constants/colors.dart';
import 'package:quraan_app/core/constants/styles.dart';
import 'package:quraan_app/features/auth/presentation/view_models/auth_cubit/auth_cubit.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TabBar(
        labelPadding: const EdgeInsets.all(0),
        unselectedLabelColor: kSecondaryColor,
        unselectedLabelStyle: Styles.textStyle14,
        labelStyle: Styles.textStyle14,
        dividerColor: Colors.transparent,
        labelColor: Colors.white,
        indicator: BoxDecoration(
          color: kPrimaryColor.withOpacity(0.8),
          border: Border.all(color: Colors.black, width: 0.5),
          borderRadius: BorderRadius.circular(12),
        ),
        onTap: (value) {
          if (value == 0) {
            BlocProvider.of<AuthCubit>(context).showLogin();
          }else{
            BlocProvider.of<AuthCubit>(context).showSignUp();
          }
        },
        indicatorColor: Colors.transparent,
        controller: _tabController,
        tabs: const [
          Expanded(child: Tab(child: Center(child: Text("Login")))),
          Expanded(child: Tab(child: Center(child: Text("Sign Up")))),
        ],
      ),
    );
  }
}
