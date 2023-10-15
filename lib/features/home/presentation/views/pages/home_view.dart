import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quraan_app/features/home/presentation/view_models/home_cubit/home_cubit.dart';
import 'package:quraan_app/features/home/presentation/views/pages/compass_view.dart';
import 'package:quraan_app/features/home/presentation/views/pages/favourit_view.dart';
import 'package:quraan_app/features/home/presentation/views/pages/first_home_view.dart';
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
        //extendBody: true,
        appBar: const CustomAppBar(),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeInitial) {
              return const FirstHomeView();
            } else if (state is FavouritState) {
              return const FavouritView();
            } else if (state is QuranState) {
              return const QuranView();
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
