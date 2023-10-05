import 'package:flutter/material.dart';

import 'package:quraan_app/core/constants/colors.dart';
import 'package:quraan_app/core/constants/styles.dart';
import 'package:quraan_app/core/widgets/custom_button.dart';
import 'package:quraan_app/features/auth/presentation/views/widgets/custom_text_button.dart';
import 'package:quraan_app/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:quraan_app/features/auth/presentation/views/widgets/custom_title.dart';
import 'package:quraan_app/features/auth/presentation/views/widgets/facebook_logo.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const CustomTitle(title: "Login"),
          const CustomTextField(hint: "UserName"),
          const CustomTextField(hint: "PassWord"),
          const SizedBox(height: 5),
          CustomTextButton(
            text: "Forget Password",
            onPressed: () {},
          ),
          const SizedBox(height: 10),
          CustomButton(
            color: kPrimaryColor,
            onPressed: () {},
            child: Text(
              "Login",
              style: Styles.textStyle16.copyWith(color: Colors.white),
            ),
          ),
          const SizedBox(height: 10),
          CustomButton(
            color: Colors.black,
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const FacebookLogo(),
                const SizedBox(width: 5),
                Text(
                  "Login With Facebook",
                  style: Styles.textStyle14.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}