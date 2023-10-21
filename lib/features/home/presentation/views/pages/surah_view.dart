import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quraan_app/core/constants/assets.dart';
import 'package:quraan_app/core/constants/styles.dart';
import 'package:quraan_app/features/home/presentation/view_models/quran_cubits/surah_cubit/surah_cubit.dart';
import 'package:quraan_app/features/home/presentation/views/widgets/custom_error_contant.dart';
import 'package:quraan_app/features/home/presentation/views/widgets/custom_loading_indicator.dart';

import '../../../../../core/constants/colors.dart';

class SurahView extends StatelessWidget {
  const SurahView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            // appBar: AppBar(
            //   centerTitle: true,
            //   title: Text(
            //     "${state.surahModel.name}",
            //     style: Styles.textStyle22,
            //   ),
            //   backgroundColor: Colors.yellow[100],
            // ),
            body: BlocBuilder<SurahCubit, SurahState>(
              builder: (context, state) {
                if (state is SurahSuccess) {
                  return Directionality(
                    textDirection: TextDirection.rtl,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 55,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(
                                  AssetsData.surahNameImage,
                                ),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "${state.surahModel.name}",
                                style: Styles.textStyle22,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Wrap(
                              alignment: WrapAlignment.start,
                              children: List.generate(
                                  state.surahModel.ayahs!.length, (index) {
                                return RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                          text: state
                                              .surahModel.ayahs![index].text!
                                              .trim(),
                                          style: Styles.textStyle20
                                              .copyWith(color: kBlackColor),
                                          spellOut: true),
                                      WidgetSpan(
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 2),
                                          width: 30,
                                          height: 30,
                                          decoration: const BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  AssetsData.ayahImage),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              state.surahModel.ayahs![index]
                                                  .numberInSurah
                                                  .toString(),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                } else if (state is SurahFailure) {
                  return CustomErrorContant(errMessage: state.errMessage);
                } else {
                  return const CustomLoadingIndicator();
                }
              },
            )));
  }
}
