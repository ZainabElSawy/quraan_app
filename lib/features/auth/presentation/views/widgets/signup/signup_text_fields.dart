import 'package:flutter/material.dart';
import 'package:quraan_app/core/functions/valid_input.dart';
import 'package:quraan_app/features/auth/presentation/view_models/signup_cubits/signup_cubit/sign_up_cubit.dart';
import 'package:quraan_app/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:quraan_app/features/auth/presentation/views/widgets/signup/terms_of_services.dart';

class SignUpTextFields extends StatelessWidget {
  const SignUpTextFields({
    super.key,
    required this.signUpCubit,
  });

  final SignUpCubit signUpCubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          validator: (val) => validInput(val!, 3, 20, "fullname"),
          hint: "Full Name",
          controller: signUpCubit.fullName,
        ),
        const SizedBox(height: 10),
        CustomTextField(
          validator: (val) => validInput(val!, 10, 40, "email"),
          hint: "E-Mail",
          controller: signUpCubit.email,
        ),
        const SizedBox(height: 10),
        CustomTextField(
          validator: (val) => validInput(val!, 6, 15, "password"),
          hint: "PassWord",
          controller: signUpCubit.password,
        ),
        const SizedBox(height: 10),
        CustomTextField(
          hint: "Confirm Password",
          controller: signUpCubit.confirmPassword,
          validator: (val) {
            if (val != signUpCubit.password.text) {
              return "Confirm password not equal to password";
            }
            return null;
          },
        ),
        const SizedBox(height: 20),
        const TermsOfServices(),
      ],
    );
  }
}
