import 'package:flutter/material.dart';
import 'package:quraan_app/core/constants/colors.dart';

class CustomTextLoading extends StatelessWidget {
  final double? width;
  final double? height;
  const CustomTextLoading({
    super.key,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: kSecondaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
