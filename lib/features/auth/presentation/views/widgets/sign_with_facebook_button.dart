import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quraan_app/core/constants/app_router.dart';
import 'package:quraan_app/core/constants/styles.dart';
import 'package:quraan_app/core/functions/show_snack_bar.dart';
import 'package:quraan_app/core/widgets/custom_button.dart';
import 'package:quraan_app/features/auth/presentation/view_models/sign_with_facebook_cubit/cubit/sign_with_face_book_cubit.dart';
import 'package:quraan_app/features/auth/presentation/views/widgets/facebook_logo.dart';

class SignWithFacebookButton extends StatelessWidget {
  const SignWithFacebookButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignWithFaceBookCubit, SignWithFaceBookState>(
      listener: (context, state) {
        if (state is SignWithFacebookLoading) {
          // Handle loading state
        } else if (state is SignWithFacebookSuccess) {
          GoRouter.of(context).push(AppRouter.kHomeView);
        } else if (state is SignWithFacebookFailure) {
          state.errMessage != null
              ? ShowSnackBar(state.errMessage!, context)
              : null;
        }
      },
      child: CustomButton(
        color: Colors.black,
        onPressed: () async {
          BlocProvider.of<SignWithFaceBookCubit>(context).signFacebook();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FacebookLogo(),
            const SizedBox(width: 5),
            Text(
              "SignUp With Facebook",
              style: Styles.textStyle14.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
