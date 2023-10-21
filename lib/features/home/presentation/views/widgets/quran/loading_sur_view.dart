import 'package:flutter/material.dart';
import 'package:quraan_app/core/constants/colors.dart';
import 'package:quraan_app/features/home/presentation/views/widgets/quran/custom_surah_listtile.dart';
import 'package:shimmer/shimmer.dart';

class LoadingSurView extends StatelessWidget {
  const LoadingSurView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: 114,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: kSecondaryColor!,
          highlightColor: kWhiteColor!,
          child: const CutomSurahListTile(),
        );
      },
    );
  }
}
