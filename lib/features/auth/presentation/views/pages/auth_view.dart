import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quraan_app/features/auth/presentation/view_models/login_cubit/login_cubit.dart';
import 'package:quraan_app/features/auth/presentation/view_models/signup_cubits/signup_cubit/sign_up_cubit.dart';
import 'package:quraan_app/features/auth/presentation/views/widgets/custom_tab_bar.dart';
import 'package:quraan_app/features/auth/presentation/views/widgets/custom_tab_bar_view.dart';
import 'package:quraan_app/features/auth/presentation/views/widgets/logo_widget.dart';
import 'package:quraan_app/features/auth/presentation/views/widgets/spacing_in_top.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

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

  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            bool loginLoading = state is LoginLoading;
            return BlocBuilder<SignUpCubit, SignUpState>(
              builder: (context, state) {
                bool loading = state is SignUpLoading || loginLoading;
                return ModalProgressHUD(
                  inAsyncCall: loading,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SpacingInTop(),
                        const LogoWidget(),
                        const SizedBox(height: 40),
                        CustomTabBar(tabController: _tabController),
                        const SizedBox(height: 20),
                        Expanded(
                          child:
                              CustomTabBarView(tabController: _tabController),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:quraan_app/features/auth/presentation/view_models/sign_with_facebook_cubit/cubit/sign_with_face_book_cubit.dart';
// import 'package:quraan_app/features/auth/presentation/view_models/signup_view_cubits/signup_cubit/sign_up_cubit.dart';
// import 'package:quraan_app/features/auth/presentation/views/widgets/custom_tab_bar.dart';
// import 'package:quraan_app/features/auth/presentation/views/widgets/custom_tab_bar_view.dart';
// import 'package:quraan_app/features/auth/presentation/views/widgets/logo_widget.dart';
// import 'package:quraan_app/features/auth/presentation/views/widgets/spacing_in_top.dart';
// import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// class AuthView extends StatefulWidget {
//   const AuthView({Key? key}) : super(key: key);

//   @override
//   State<AuthView> createState() => _AuthViewState();
// }

// class _AuthViewState extends State<AuthView>
//     with SingleTickerProviderStateMixin {
//   late final TabController _tabController;

//   @override
//   void initState() {
//     _tabController = TabController(length: 2, vsync: this);
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   bool loading = false;
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: BlocBuilder<SignWithFaceBookCubit, SignWithFaceBookState>(
//           builder: (context, state) {
//             bool signWithFacebookLoading = state is SignWithFacebookLoading;
//             return BlocBuilder<SignUpCubit, SignUpState>(
//               builder: (context, state) {
//                 bool loading =
//                     state is SignUpLoading || signWithFacebookLoading;
//                 return ModalProgressHUD(
//                   inAsyncCall: loading,
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 30),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         const SpacingInTop(),
//                         const LogoWidget(),
//                         const SizedBox(height: 40),
//                         CustomTabBar(tabController: _tabController),
//                         const SizedBox(height: 20),
//                         Expanded(
//                           child:
//                               CustomTabBarView(tabController: _tabController),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
