import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quraan_app/core/constants/colors.dart';
import 'package:quraan_app/features/auth/presentation/view_models/signup_cubits/check_box_cubit/check_box_cubit.dart';

// ignore: must_be_immutable
class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomCheckBoxCubit, bool>(
      builder: (context, state) {
        return Checkbox(
          activeColor: kPrimaryColor,
          value: state,
          onChanged: (value) {
            context.read<CustomCheckBoxCubit>().toggleValue();
          },
        );
      },
    );
  }
}
