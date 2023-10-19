import 'package:flutter/material.dart';
import 'package:quraan_app/core/constants/colors.dart';
import 'package:quraan_app/core/constants/styles.dart';

// ignore: must_be_immutable
class PrayingTime extends StatelessWidget {
  final String? pray;
  final String? time;
  const PrayingTime({super.key, this.pray, this.time});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border:
              Border.all(color: kSecondaryColor!.withOpacity(0.5), width: 1),
        ),
        child: pray == null && time == null
            ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 70,
                      height: 15,
                      decoration: BoxDecoration(
                        color: kSecondaryColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    Container(
                      width: 70,
                      height: 15,
                      decoration: BoxDecoration(
                        color: kSecondaryColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ],
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(time ?? '', style: Styles.textStyle20),
                  Text(pray ?? '', style: Styles.textStyle20),
                ],
              ),
      ),
    );
  }
}
