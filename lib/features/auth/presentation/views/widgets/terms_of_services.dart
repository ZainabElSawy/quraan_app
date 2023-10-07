import 'package:flutter/material.dart';

import 'package:quraan_app/core/constants/colors.dart';
import 'package:quraan_app/core/constants/styles.dart';
import 'package:quraan_app/features/auth/presentation/views/widgets/custom_check_box.dart';

// ignore: must_be_immutable
class TermsOfServices extends StatelessWidget {
  TermsOfServices({
    super.key,
  });

  bool val = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomCheckBox(val: val),
        const SizedBox(width: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("I agree all statements in"),
            Text(
              "terms of services",
              style: Styles.textStyle14.copyWith(color: kPrimaryColor),
            )
          ],
        )
      ],
    );
  }
}


