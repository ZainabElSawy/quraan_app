import 'package:flutter/material.dart';

import 'package:quraan_app/core/constants/colors.dart';
import 'package:quraan_app/features/home/data/models/prayer_timings_model/hijri.dart';
import 'package:quraan_app/features/home/presentation/views/widgets/prayer_times/date_or_month.dart';

// ignore: must_be_immutable
class Date extends StatelessWidget {
  Hijri? date;
  Date({
    Key? key,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: kWhiteColor!, width: 2),
      ),
      child: Row(
        children: [
          DateOrMonth(
            text: date?.month!.ar ?? '',
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
          ),
          DateOrMonth(
            text: date?.day ?? '',
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
          ),
        ],
      ),
    );
  }
}
