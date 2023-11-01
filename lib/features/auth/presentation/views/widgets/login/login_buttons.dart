import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quraan_app/features/auth/data/repos/auth_repo_imp.dart';
import 'package:quraan_app/features/auth/presentation/view_models/login_cubit/login_cubit.dart';
import 'package:quraan_app/features/auth/presentation/view_models/sign_with_facebook_cubit/cubit/sign_with_face_book_cubit.dart';
import 'package:quraan_app/features/auth/presentation/views/widgets/custom_text_button.dart';
import 'package:quraan_app/features/auth/presentation/views/widgets/login/login_with_email_button.dart';
import 'package:quraan_app/features/auth/presentation/views/widgets/sign_with_facebook_button.dart';

import '../../../../../../core/dependency_injection/service_locator.dart';

class LoginButtons extends StatelessWidget {
  final LoginCubit loginCubit;
  const LoginButtons({
    Key? key,
    required this.loginCubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextButton(
          text: "Forget Password",
          onPressed: () {},
        ),
        const SizedBox(height: 15),
        LoginWithEmailButton(loginCubit: loginCubit),
        const SizedBox(height: 10),
        BlocProvider(
          create: (context) => SignWithFaceBookCubit(getIt.get<AuthRepoImp>()),
          child: const SignWithFacebookButton(),
        )
      ],
    );
  }
}
