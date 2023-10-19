import 'package:flutter/material.dart';
import 'package:quraan_app/core/constants/colors.dart';
import 'package:quraan_app/features/home/presentation/views/widgets/prayer_times/custom_date_container.dart';
import 'package:quraan_app/features/home/presentation/views/widgets/prayer_times/praying_time.dart';
import 'package:shimmer/shimmer.dart';

class LoadingPrayerTimingsView extends StatelessWidget {
  const LoadingPrayerTimingsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
        SliverToBoxAdapter(
          child: Shimmer.fromColors(
            baseColor: kSecondaryColor!,
            highlightColor: kWhiteColor!,
            child: Column(
              children: [
                CustomDateContainer(),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    height: MediaQuery.of(context).size.height * 0.11,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => const Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: PrayingTime(),
                  ),
                  itemCount: 5,
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
