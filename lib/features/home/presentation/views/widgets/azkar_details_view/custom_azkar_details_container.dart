import 'package:flutter/material.dart';

import '../../../../../../core/constants/colors.dart';
import '../../../../../../core/constants/styles.dart';
import '../../../../data/models/azkar_model/azkar_details_model.dart';

class CustomAzkarDetailsContainer extends StatelessWidget {
  final AzkarDetailsModel azkarDetailsModel;
  const CustomAzkarDetailsContainer({
    Key? key,
    required this.azkarDetailsModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 20,
      ),
      decoration: BoxDecoration(
        color: kLightOrangeColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              azkarDetailsModel.reference ?? "",
              style: Styles.textStyle18,
            ),
            const SizedBox(height: 5),
            Text(
              azkarDetailsModel.content ?? "",
              style: Styles.textStyle16,
            )
          ],
        ),
      ),
    );
  }
}

