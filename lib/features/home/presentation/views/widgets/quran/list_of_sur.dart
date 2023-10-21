import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../view_models/quran_cubits/sur_cubit/quran_cubit.dart';
import '../custom_error_contant.dart';
import 'custom_surah_listtile.dart';
import 'loading_sur_view.dart';

class ListOfSur extends StatelessWidget {
  const ListOfSur({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SurCubit, SurState>(
      builder: (context, state) {
        if (state is SurSuccess) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: state.surList.length,
            itemBuilder: (context, index) {
              return CutomSurahListTile(
                surah: state.surList[index],
                numberOfSurah: state.surList[index].number!,
              );
            },
          );
        } else if (state is SurFailure) {
          return CustomErrorContant(errMessage: state.errMessage);
        } else {
          return const LoadingSurView();
        }
      },
    );
  }
}
