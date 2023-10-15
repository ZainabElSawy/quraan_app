import 'package:flutter/material.dart';
import 'package:quraan_app/features/home/presentation/views/widgets/custom_date_container.dart';
import 'package:quraan_app/features/home/presentation/views/widgets/praying_time.dart';
import 'package:quraan_app/features/home/presentation/views/widgets/time_remaining.dart';

class FirstHomeView extends StatelessWidget {
  const FirstHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: CustomScrollView(physics: BouncingScrollPhysics(), slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              CustomDateContainer(),
              SizedBox(height: 20),
              TimeRemaining(),
              SizedBox(height: 15),
              PrayingTime(time: "04:49", pray: "الفجر"),
              SizedBox(height: 15),
              PrayingTime(time: "12:59", pray: "الضهر"),
              SizedBox(height: 15),
              PrayingTime(time: "16:35", pray: "العصر"),
              SizedBox(height: 15),
              PrayingTime(time: "19:34", pray: "المغرب"),
              SizedBox(height: 15),
              PrayingTime(time: "21:04", pray: "العشاء"),
            ],
          ),
        )
      ]),
    );
  }
}
