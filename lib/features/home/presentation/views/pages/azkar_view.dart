import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quraan_app/features/home/presentation/view_models/azkar_cubit/azkar_cubit/azkar_cubit.dart';
import 'package:quraan_app/features/home/presentation/views/widgets/custom_error_contant.dart';
import 'package:quraan_app/features/home/presentation/views/widgets/custom_loading_indicator.dart';

import '../widgets/azkar/custom_azkar_title.dart';
import '../widgets/azkar/list_of_azkar.dart';

class AzkarView extends StatelessWidget {
  const AzkarView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AzkarCubit, AzkarState>(
      builder: (context, state) {
        if (state is AzkarFailure) {
          return CustomErrorContant(errMessage: state.errMessage);
        } else if (state is AzkarSuccess) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomAzkarTitle(),
              ListOfAzkar(azkarList: state.azkarList),
            ],
          );
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
