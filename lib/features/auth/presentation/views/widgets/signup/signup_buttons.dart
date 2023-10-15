import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quraan_app/features/auth/data/repos/auth_repo_imp.dart';
import 'package:quraan_app/features/auth/presentation/view_models/sign_with_facebook_cubit/cubit/sign_with_face_book_cubit.dart';
import 'package:quraan_app/features/auth/presentation/view_models/signup_view_cubits/signup_cubit/sign_up_cubit.dart';
import 'package:quraan_app/features/auth/presentation/views/widgets/sign_with_facebook_button.dart';
import 'package:quraan_app/features/auth/presentation/views/widgets/signup/signup_with_email_button.dart';

class SignUpButtons extends StatelessWidget {
  const SignUpButtons({
    super.key,
    required this.signUpCubit,
  });

  final SignUpCubit signUpCubit;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SignUpWithEmailButton(signUpCubit: signUpCubit),
        const SizedBox(height: 10),
        BlocProvider(
          create: (context) => SignWithFaceBookCubit(AuthRepoImp()),
          child: const SignWithFacebookButton(),
        )
      ],
    );
  }
}

