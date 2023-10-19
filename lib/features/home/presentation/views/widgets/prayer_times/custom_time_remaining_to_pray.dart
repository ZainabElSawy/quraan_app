import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quraan_app/core/constants/colors.dart';
import 'package:quraan_app/core/constants/styles.dart';

class CustomTimeRemainingToPray extends StatelessWidget {
  const CustomTimeRemainingToPray({
    Key? key,
    required this.prayTime,
    required this.formattedTime,
    required this.azan,
  }) : super(key: key);

  final String prayTime;
  final DateTime formattedTime;
  final String azan;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "باقي على أذان $azan",
          style: Styles.textStyle20.copyWith(
            color: kWhiteColor,
          ),
        ),
        Text(
          DateFormat.Hm().format(
            DateTime(0).add(
              DateFormat.Hm().parseStrict(prayTime).difference(formattedTime),
            ),
          ),
          style: Styles.textStyle20.copyWith(
            color: kWhiteColor,
          ),
        ),
      ],
    );
  }
}
