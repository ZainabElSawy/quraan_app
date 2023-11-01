import 'package:flutter/material.dart';

import '../../../../../../core/constants/colors.dart';
import '../../../../../../core/constants/styles.dart';

class CustomAzkarTitle extends StatelessWidget {
  const CustomAzkarTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "الأدعية و الاذكار",
      style: Styles.textStyle40.copyWith(color: kPrimaryColor),
    );
  }
}
