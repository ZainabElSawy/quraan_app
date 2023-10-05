import 'package:flutter/material.dart';
import 'package:quraan_app/core/constants/colors.dart';
import 'package:quraan_app/core/constants/styles.dart';
import 'package:quraan_app/core/widgets/custom_button.dart';
import 'package:quraan_app/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:quraan_app/features/auth/presentation/views/widgets/custom_title.dart';
import 'package:quraan_app/features/auth/presentation/views/widgets/facebook_logo.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const CustomTitle(title: "Create Account"),
          const CustomTextField(hint: "Full Name"),
          const CustomTextField(hint: "E-Mail"),
          const CustomTextField(hint: "PassWord"),
          const CustomTextField(hint: "Confirm Password"),
          const SizedBox(height: 20),
          const TermsOfServices(),
          const SizedBox(height: 15),
          CustomButton(
            color: kPrimaryColor,
            onPressed: () {},
            child: Text(
              "Sign Up",
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
                  "SignUp With Facebook",
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

class TermsOfServices extends StatefulWidget {
  const TermsOfServices({
    super.key,
  });

  @override
  State<TermsOfServices> createState() => _TermsOfServicesState();
}

class _TermsOfServicesState extends State<TermsOfServices> {
  bool val = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(
          value: val,
          onChanged: (value) {
            setState(() {
              val = value ?? false;
            });
          },
        ),
        const SizedBox(width: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("I agree all statements in"),
            Text(
              "terms of services",
              style: Styles.textStyle14.copyWith(color: kPrimaryColor),
            )
          ],
        )
      ],
    );
  }
}
