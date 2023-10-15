import 'package:flutter/material.dart';
import 'package:quraan_app/core/constants/assets.dart';
import 'package:quraan_app/core/constants/colors.dart';
import 'package:quraan_app/core/constants/styles.dart';
import 'package:quraan_app/features/home/presentation/views/widgets/date.dart';

class CustomDateContainer extends StatelessWidget {
  const CustomDateContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.17,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: const DecorationImage(
            image: AssetImage(AssetsData.islamicBackground), fit: BoxFit.fill),
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
              const Date(),
            ],
          ),
          const SizedBox(width: 15),
        ],
      ),
    );
  }
}
