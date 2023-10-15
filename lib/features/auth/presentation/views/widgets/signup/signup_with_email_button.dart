import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quraan_app/core/constants/app_router.dart';
import 'package:quraan_app/core/constants/colors.dart';
import 'package:quraan_app/core/constants/styles.dart';
import 'package:quraan_app/core/functions/show_snack_bar.dart';
import 'package:quraan_app/core/widgets/custom_button.dart';
import 'package:quraan_app/features/auth/presentation/view_models/signup_view_cubits/signup_cubit/sign_up_cubit.dart';

class SignUpWithEmailButton extends StatelessWidget {
  const SignUpWithEmailButton({
    super.key,
    required this.signUpCubit,
  });

  final SignUpCubit signUpCubit;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpLoading) {
          // Handle loading state
        } else if (state is SignUpSuccess) {
          GoRouter.of(context).push(AppRouter.kHomeView);
        } else if (state is SignUpFailure) {
          state.errMessage != null
              ? ShowSnackBar(state.errMessage!, context)
              : null;
        }
      },
      child: CustomButton(
        color: kPrimaryColor,
        onPressed: () async {
          if (signUpCubit.formstate.currentState!.validate()) {
            BlocProvider.of<SignUpCubit>(context).signUp(
              inpEmail: signUpCubit.email.text,
              inpPassword: signUpCubit.password.text,
            );
          }
        },
        child: Text(
          "Sign Up",
          style: Styles.textStyle16.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}

