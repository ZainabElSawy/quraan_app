import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quraan_app/core/services/service_locator.dart';
import 'package:quraan_app/features/home/data/repo/home_repository/home_repo_imp.dart';
import 'package:quraan_app/features/home/data/repo/quran_repository/quran_repo_imp.dart';
import 'package:quraan_app/features/home/presentation/view_models/home_cubit/home_cubit.dart';
import 'package:quraan_app/features/home/presentation/view_models/prayer_timings_cubit/player_timings_cubit.dart';
import 'package:quraan_app/features/home/presentation/view_models/quran_cubits/sur_cubit/quran_cubit.dart';
import 'package:quraan_app/features/home/presentation/views/pages/compass_view.dart';
import 'package:quraan_app/features/home/presentation/views/pages/favourit_view.dart';
import 'package:quraan_app/features/home/presentation/views/pages/prayers_timings_view.dart';
import 'package:quraan_app/features/home/presentation/views/pages/prayers_view.dart';
import 'package:quraan_app/features/home/presentation/views/pages/quran_view.dart';

import 'package:quraan_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:quraan_app/features/home/presentation/views/widgets/custom_navigation_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeInitial) {
              return BlocProvider(
                create: (context) =>
                    PlayerTimingsCubit(getIt.get<HomeRepoImp>())
                      ..fetchPrayerTimings(),
                child: const PrayerTimingsView(),
              );
            } else if (state is FavouritState) {
              return const FavouritView();
            } else if (state is QuranState) {
              return BlocProvider(
                create: (context) =>
                    SurCubit(getIt.get<QuranRepoImp>())..fetchSur(),
                child: const QuranView(),
              );
            } else if (state is CompassState) {
              return const CompassView();
            } else if (state is PrayersState) {
              return const PrayersView();
            } else {
              return Container();
            }
          },
        ),
        bottomNavigationBar:
            CustomNavigationBar(bottomNavigationKey: _bottomNavigationKey),
      ),
    );
  }
}
