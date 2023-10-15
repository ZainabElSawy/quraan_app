import 'package:flutter/material.dart';
import 'package:quraan_app/core/constants/colors.dart';
import 'package:quraan_app/core/constants/styles.dart';

class TimeRemaining extends StatelessWidget {
  const TimeRemaining({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        width: double.infinity,
        decoration: BoxDecoration(
            color: kPrimaryColor, borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "باقي علي اذان المغرب",
              style: Styles.textStyle20.copyWith(
                color: kWhiteColor,
              ),
            ),
            Text(
              " 01: 30: 20",
              style: Styles.textStyle20.copyWith(
                color: kWhiteColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
