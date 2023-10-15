import 'package:flutter/material.dart';

import 'package:quraan_app/core/functions/valid_input.dart';
import 'package:quraan_app/features/auth/presentation/view_models/login_cubit/login_cubit.dart';
import 'package:quraan_app/features/auth/presentation/views/widgets/custom_text_field.dart';

class LoginTextFields extends StatelessWidget {
  const LoginTextFields({
    Key? key,
    required this.loginViewModelCubit,
  }) : super(key: key);

  final LoginCubit loginViewModelCubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          hint: "Email",
          controller: loginViewModelCubit.email,
          validator: (val) => validInput(val!, 10, 40, "email"),
        ),
        const SizedBox(height: 10),
        CustomTextField(
          hint: "PassWord",
          controller: loginViewModelCubit.password,
          validator: (val) => validInput(val!, 6, 15, "password"),
        ),
      ],
    );
  }
}
