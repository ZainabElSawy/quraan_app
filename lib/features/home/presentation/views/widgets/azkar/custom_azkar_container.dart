import 'package:flutter/material.dart';

import '../../../../../../core/constants/colors.dart';
import '../../../../../../core/constants/styles.dart';

class CustomAzkarContainer extends StatelessWidget {
  final String zekr;
  final void Function()? onTap;
  const CustomAzkarContainer({
    Key? key,
    required this.zekr,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 48,
          vertical: 10,
        ),
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          border: Border.all(color: kBlackColor!, width: 0.5),
          borderRadius: BorderRadius.circular(35),
        ),
        child: Text(
          zekr,
          style: Styles.textStyle18,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
