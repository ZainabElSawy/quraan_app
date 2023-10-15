import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quraan_app/core/constants/app_router.dart';
import 'package:quraan_app/core/constants/colors.dart';
import 'package:quraan_app/core/constants/styles.dart';
import 'package:quraan_app/core/functions/show_snack_bar.dart';
import 'package:quraan_app/core/widgets/custom_button.dart';
import 'package:quraan_app/features/auth/data/repos/auth_repo_imp.dart';
import 'package:quraan_app/features/auth/presentation/view_models/signup_view_cubits/signup_cubit/sign_up_cubit.dart';
import 'package:quraan_app/features/auth/presentation/views/widgets/custom_title.dart';
import 'package:quraan_app/features/auth/presentation/views/widgets/facebook_logo.dart';
import 'package:quraan_app/features/auth/presentation/views/widgets/signup/signup_buttons.dart';
import 'package:quraan_app/features/auth/presentation/views/widgets/signup/signup_text_fields.dart';

// ignore: must_be_immutable
class SignUpBody extends StatelessWidget {
  SignUpBody({super.key});
  SignUpCubit signUpCubit = SignUpCubit(AuthRepoImp());
  @override
  Widget build(BuildContext context) {
    return Form(
      key: signUpCubit.formstate,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CustomTitle(title: "Create Account"),
            const SizedBox(height: 5),
            SignUpTextFields(signUpCubit: signUpCubit),
            const SizedBox(height: 15),
            SignUpButtons(signUpCubit: signUpCubit),
          ],
        ),
      ),
    );
  }
}

