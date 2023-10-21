import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:quraan_app/core/constants/colors.dart';
import 'package:quraan_app/core/constants/styles.dart';
import 'package:quraan_app/features/home/data/models/quran_models/sur_model/sur_model.dart';
import 'package:quraan_app/features/home/presentation/views/widgets/quran/custom_text_loading.dart';

import '../../../../../../core/constants/app_router.dart';

// ignore: must_be_immutable
class CutomSurahListTile extends StatelessWidget {
  final SurModel? surah;
  final int? numberOfSurah;
  const CutomSurahListTile({
    Key? key,
    this.surah,
    this.numberOfSurah,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: surah != null
          ? const Border(
              bottom: BorderSide(
                color: Colors.grey,
                width: 1.0,
              ),
            )
          : null,
      contentPadding: const EdgeInsets.all(0),
      onTap: () {
        GoRouter.of(context).push(AppRouter.kSurahView, extra: numberOfSurah);
      },
      title: surah != null
          ? Text(
              surah!.name!,
              textDirection: TextDirection.rtl,
              style: Styles.textStyle22,
            )
          : const CustomTextLoading(height: 15),
      subtitle: surah != null
          ? Text(
              "${surah!.revelationType}-${surah!.numberOfAyahs}",
              textDirection: TextDirection.rtl,
              style: Styles.textStyle18,
            )
          : const CustomTextLoading(height: 15),
      trailing: CircleAvatar(
        radius: 18,
        backgroundColor: kBlackColor,
        child: Text(
          "${surah?.number}",
          style: TextStyle(
            color: kWhiteColor,
            fontSize: 18,
          ),
        ),
      ),
      leading: const Icon(
        CupertinoIcons.back,
        size: 28,
      ),
    );
  }
}
