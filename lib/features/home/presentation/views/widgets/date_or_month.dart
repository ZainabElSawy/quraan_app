import 'package:flutter/material.dart';
import 'package:quraan_app/core/constants/colors.dart';
import 'package:quraan_app/core/constants/styles.dart';

class DateOrMonth extends StatelessWidget {
  final BorderRadiusGeometry borderRadius;
  final String text;
  const DateOrMonth({
    super.key,
    required this.borderRadius,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        border: Border.all(color: kWhiteColor!, width: 2),
      ),
      child: Text(
        text,
        style: Styles.textStyle18.copyWith(color: kWhiteColor),
      ),
    );
  }
}
