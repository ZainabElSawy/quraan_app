import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quraan_app/core/constants/assets.dart';
import 'package:quraan_app/core/constants/colors.dart';
import 'package:quraan_app/features/home/presentation/view_models/home_cubit/home_cubit.dart';

// ignore: must_be_immutable
class CustomNavigationBar extends StatelessWidget {
  GlobalKey<CurvedNavigationBarState> bottomNavigationKey;
  //int page;
  CustomNavigationBar({
    Key? key,
    required this.bottomNavigationKey,
    //required this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      child: CurvedNavigationBar(
        key: bottomNavigationKey,
        index: 0,
        height: 60.0,
        color: kPrimaryColor,
        buttonBackgroundColor: kPrimaryColor,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        letIndexChange: (index) => true,
        onTap: (index) {
          if (index == 0) {
            BlocProvider.of<HomeCubit>(context).showHome();
          } else if (index == 1) {
            BlocProvider.of<HomeCubit>(context).showFavourit();
          } else if (index == 2) {
            BlocProvider.of<HomeCubit>(context).showQuran();
          } else if (index == 3) {
            BlocProvider.of<HomeCubit>(context).showCompass();
          } else if (index == 4) {
            BlocProvider.of<HomeCubit>(context).showPrayers();
          }
        },
        items: <Widget>[
          const Icon(Icons.home, size: 30),
          const Icon(Icons.favorite, size: 30),
          Image.asset(
            AssetsData.quranLogo,
            width: 30,
            height: 30,
            fit: BoxFit.fill,
          ),
          const Icon(Icons.explore, size: 30),
          const Icon(Icons.waving_hand, size: 30),
        ],
      ),
    );
  }
}
