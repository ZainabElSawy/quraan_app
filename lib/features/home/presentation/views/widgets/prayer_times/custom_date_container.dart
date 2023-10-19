import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quraan_app/core/constants/assets.dart';
import 'package:quraan_app/core/constants/colors.dart';
import 'package:quraan_app/core/constants/styles.dart';
import 'package:quraan_app/features/home/data/models/prayer_timings_model/hijri.dart';
import 'package:quraan_app/features/home/presentation/view_models/prayer_timings_cubit/player_timings_cubit.dart';
import 'package:quraan_app/features/home/presentation/views/widgets/prayer_times/date.dart';

// ignore: must_be_immutable
class CustomDateContainer extends StatelessWidget {
  Hijri? date;
  CustomDateContainer({
    Key? key,
    this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerTimingsCubit, PlayerTimingsState>(
      builder: (context, state) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.17,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: const DecorationImage(
              image: AssetImage(AssetsData.islamicBackground),
              fit: BoxFit.fill,
            ),
          ),
          child: Row(
            children: [
              const Spacer(),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "اليوم",
                    style: Styles.textStyle22.copyWith(color: kWhiteColor),
                  ),
                  const SizedBox(height: 10),
                  Date(date: date ),
                ],
              ),
              const SizedBox(width: 15),
            ],
          ),
        );
      },
    );
  }
}
