import 'package:flutter/material.dart';
import 'package:quraan_app/core/constants/colors.dart';
import 'package:quraan_app/core/constants/styles.dart';

class CustomTextButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  const CustomTextButton({
    super.key,
    this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: Styles.textStyle14.copyWith(color: kSecondaryColor),
        ),
      ),
    );
  }
}
