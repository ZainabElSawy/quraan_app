import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quraan_app/features/home/presentation/view_models/prayer_timings_cubit/player_timings_cubit.dart';
import 'package:quraan_app/features/home/presentation/views/widgets/prayer_times/custom_date_container.dart';
import 'package:quraan_app/features/home/presentation/views/widgets/custom_error_contant.dart';
import 'package:quraan_app/features/home/presentation/views/widgets/prayer_times/custom_praying_time_column.dart';
import 'package:quraan_app/features/home/presentation/views/widgets/prayer_times/loading_prayer_timings_view.dart';
import 'package:quraan_app/features/home/presentation/views/widgets/prayer_times/time_remaining.dart';

class PrayerTimingsView extends StatelessWidget {
  const PrayerTimingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerTimingsCubit, PlayerTimingsState>(
      builder: (context, state) {
        if (state is PrayerTimingsSuccess) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        CustomDateContainer(
                          date: state.prayerTimingsModel.date!.hijri!,
                        ),
                        const SizedBox(height: 20),
                        TimeRemaining(
                          prayTime: state.prayerTimingsModel.timings,
                        ),
                        const SizedBox(height: 15),
                        CustomPrayingTimeColumn(
                          prayTime: state.prayerTimingsModel.timings!,
                        ),
                      ],
                    ),
                  )
                ]),
          );
        } else if (state is PrayerTimingsFailure) {
          return CustomErrorContant(errMessage: state.errMessage);
        } else {
          return const LoadingPrayerTimingsView();
        }
      },
    );
  }
}
