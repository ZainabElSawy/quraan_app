import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:quraan_app/core/constants/colors.dart';
import 'package:quraan_app/features/home/data/models/prayer_timings_model/timings.dart';
import 'package:quraan_app/features/home/presentation/views/widgets/prayer_times/custom_time_remaining_to_pray.dart';

// ignore: must_be_immutable
class TimeRemaining extends StatelessWidget {
  Timings? prayTime;
  TimeRemaining({
    Key? key,
    this.prayTime,
  }) : super(key: key);
  DateTime formattedTime = DateFormat.Hm().parseStrict(
      "${DateTime.now().hour < 23 ? DateTime.now().hour + 1 : 1}:${DateTime.now().minute}");

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        width: double.infinity,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: (formattedTime.hour <=
                DateFormat.Hm().parseStrict(prayTime!.fajr!).hour)
            ? CustomTimeRemainingToPray(
                azan: 'الفجر',
                prayTime: prayTime!.fajr!,
                formattedTime: formattedTime,
              )
            : formattedTime.hour <=
                    DateFormat.Hm()
                        .parseStrict(
                          prayTime!.dhuhr!,
                        )
                        .hour
                ? CustomTimeRemainingToPray(
                    azan: 'الظهر',
                    prayTime: prayTime!.dhuhr!,
                    formattedTime: formattedTime,
                  )
                : formattedTime.hour <=
                        DateFormat.Hm().parseStrict(prayTime!.asr!).hour
                    ? CustomTimeRemainingToPray(
                        azan: 'العصر',
                        prayTime: prayTime!.asr!,
                        formattedTime: formattedTime,
                      )
                    : formattedTime.hour <=
                            DateFormat.Hm().parseStrict(prayTime!.maghrib!).hour
                        ? CustomTimeRemainingToPray(
                            azan: 'المغرب',
                            prayTime: prayTime!.isha!,
                            formattedTime: formattedTime,
                          )
                        : CustomTimeRemainingToPray(
                            azan: 'العشاء',
                            prayTime: prayTime!.isha!,
                            formattedTime: formattedTime,
                          ),
      ),
    );
  }
}
