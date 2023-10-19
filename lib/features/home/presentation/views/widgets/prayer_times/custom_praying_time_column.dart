import 'package:flutter/material.dart';

import 'package:quraan_app/features/home/data/models/prayer_timings_model/timings.dart';
import 'package:quraan_app/features/home/presentation/views/widgets/prayer_times/praying_time.dart';

// ignore: must_be_immutable
class CustomPrayingTimeColumn extends StatelessWidget {
  Timings prayTime;
  CustomPrayingTimeColumn({
    Key? key,
    required this.prayTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PrayingTime(
          time: prayTime.fajr!,
          pray: "الفجر",
        ),
        const SizedBox(height: 15),
        PrayingTime(
          time: prayTime.dhuhr!,
          pray: "الضهر",
        ),
        const SizedBox(height: 15),
        PrayingTime(
          time: prayTime.asr!,
          pray: "العصر",
        ),
        const SizedBox(height: 15),
        PrayingTime(
          time: prayTime.maghrib!,
          pray: "المغرب",
        ),
        const SizedBox(height: 15),
        PrayingTime(
          time: prayTime.isha!,
          pray: "العشاء",
        ),
      ],
    );
  }
}
