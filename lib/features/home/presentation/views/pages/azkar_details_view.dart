import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quraan_app/features/home/presentation/views/widgets/custom_error_contant.dart';
import 'package:quraan_app/features/home/presentation/views/widgets/custom_loading_indicator.dart';

import '../../view_models/azkar_cubit/azkar_details_cubit/azkar_details_cubit.dart';
import '../widgets/azkar_details_view/azkar_details_appbar.dart';
import '../widgets/azkar_details_view/azkar_details_list.dart';

class AzkarDetailsView extends StatelessWidget {
  const AzkarDetailsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<AzkarDetailsCubit, AzkarDetailsState>(
        builder: (context, state) {
          if (state is AzkarDetailsSuccess) {
            return Scaffold(
              appBar: AzkarDetailsAppBar(
                  sectionId: state.azkarDetailsList[0].sectionId!,),
              body:
                  ListOfAzkarDetails(azkarDetailsList: state.azkarDetailsList,),
            );
          } else if (state is AzkarDetailsFailure) {
            return CustomErrorContant(errMessage: state.errMessage);
          } else {
            return const CustomLoadingIndicator();
          }
        },
      ),
    );
  }
}
