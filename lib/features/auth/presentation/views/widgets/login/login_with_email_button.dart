import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quraan_app/core/constants/app_router.dart';
import 'package:quraan_app/core/constants/colors.dart';
import 'package:quraan_app/core/constants/styles.dart';
import 'package:quraan_app/core/functions/show_snack_bar.dart';
import 'package:quraan_app/core/widgets/custom_button.dart';
import 'package:quraan_app/features/auth/presentation/view_models/login_cubit/login_cubit.dart';

class LoginWithEmailButton extends StatelessWidget {
  const LoginWithEmailButton({
    super.key,
    required this.loginCubit,
  });

  final LoginCubit loginCubit;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
        } else if (state is LoginSuccess) {
          GoRouter.of(context).push(AppRouter.kHomeView);
        } else if (state is LoginFailure) {
          state.errMessage != null
              ? ShowSnackBar(state.errMessage!, context)
              : null;
        }
      },
      child: CustomButton(
        color: kPrimaryColor,
        onPressed: () async {
          if (loginCubit.formState.currentState!.validate()) {
            BlocProvider.of<LoginCubit>(context).login(
                inpEmail: loginCubit.email.text,
                inpPassword: loginCubit.password.text);
          }
        },
        child: Text(
          "Login",
          style: Styles.textStyle16.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
