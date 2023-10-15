import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quraan_app/core/constants/colors.dart';
import 'package:quraan_app/core/constants/styles.dart';
import 'package:quraan_app/features/auth/presentation/view_models/signup_cubits/check_box_cubit/check_box_cubit.dart';
import 'package:quraan_app/features/auth/presentation/views/widgets/signup/custom_check_box.dart';

// ignore: must_be_immutable
class TermsOfServices extends StatelessWidget {
  const TermsOfServices({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        BlocProvider(
          create: (context) => CustomCheckBoxCubit(false),
          child: const CustomCheckBox(),
        ),
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
