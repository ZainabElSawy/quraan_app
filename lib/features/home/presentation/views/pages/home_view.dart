import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quraan_app/core/dependency_injection/service_locator.dart';
import 'package:quraan_app/features/home/data/repo/quran_repository/quran_repo_imp.dart';
import 'package:quraan_app/features/home/presentation/view_models/azkar_cubit/azkar_cubit/azkar_cubit.dart';

import 'package:quraan_app/features/home/presentation/views/pages/compass_view.dart';
import 'package:quraan_app/features/home/presentation/views/pages/favourit_view.dart';
import 'package:quraan_app/features/home/presentation/views/pages/prayers_timings_view.dart';
import 'package:quraan_app/features/home/presentation/views/pages/azkar_view.dart';
import 'package:quraan_app/features/home/presentation/views/pages/quran_view.dart';

import 'package:quraan_app/features/home/presentation/views/widgets/custom_app_bar.dart';

import '../../../../../core/constants/assets.dart';
import '../../../../../core/constants/colors.dart';
import '../../../data/repo/azkar_repository/azkar_repo_imp.dart';
import '../../../data/repo/prayer_timings_repository/prayer_timings_repo_imp.dart';
import '../../view_models/prayer_timings_cubit/player_timings_cubit.dart';
import '../../view_models/quran_cubits/sur_cubit/quran_cubit.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int page = 2;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: pagesList[page],
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            iconTheme: const IconThemeData(color: Colors.white),
          ),
          child: CurvedNavigationBar(
            key: _bottomNavigationKey,
            index: 2,
            height: 60.0,
            color: kPrimaryColor,
            buttonBackgroundColor: kPrimaryColor,
            backgroundColor: Colors.transparent,
            animationCurve: Curves.easeInOut,
            animationDuration: const Duration(milliseconds: 600),
            letIndexChange: (index) => true,
            onTap: (index) {
              setState(() {
                page = index;
              });
            },
            items: itemsList,
          ),
        ),
      ),
    );
  }

  List<Widget> itemsList = <Widget>[
    Image.asset(
      AssetsData.quranLogo,
      width: 30,
      height: 30,
      fit: BoxFit.fill,
    ),
    const Icon(Icons.favorite, size: 30),
    const Icon(Icons.home, size: 30),
    const Icon(Icons.explore, size: 30),
    const Icon(Icons.waving_hand, size: 30),
  ];
  var pagesList = [
    BlocProvider(
      create: (context) => SurCubit(getIt.get<QuranRepoImpl>())..fetchSur(),
      child: const QuranView(),
    ),
    const FavouritView(),
    BlocProvider(
      create: (context) => PlayerTimingsCubit(getIt.get<PrayerTimingsRepoImp>())
        ..fetchPrayerTimings(),
      child: const PrayerTimingsView(),
    ),
    const CompassView(),
    BlocProvider(
      create: (context) => AzkarCubit(getIt.get<AzkarRepoImp>())..fetchAzkar(),
      child: const AzkarView(),
    ),
  ];
}
