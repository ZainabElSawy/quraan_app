import 'package:flutter/material.dart';
import 'package:quraan_app/features/auth/data/repos/auth_repo_imp.dart';
import 'package:quraan_app/features/auth/presentation/view_models/login_cubit/login_cubit.dart';

import 'package:quraan_app/features/auth/presentation/views/widgets/custom_title.dart';
import 'package:quraan_app/features/auth/presentation/views/widgets/login/login_buttons.dart';
import 'package:quraan_app/features/auth/presentation/views/widgets/login/login_text_fields.dart';

// ignore: must_be_immutable
class LoginBody extends StatelessWidget {
  LoginBody({super.key});
  LoginCubit loginCubit = LoginCubit(AuthRepoImp());
  @override
  Widget build(BuildContext context) {
    return Form(
      key: loginCubit.formState,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CustomTitle(title: "Login"),
            const SizedBox(height: 5),
            LoginTextFields(loginViewModelCubit: loginCubit),
            const SizedBox(height: 10),
            LoginButtons(loginCubit: loginCubit)
          ],
        ),
      ),
    );
  }
}
