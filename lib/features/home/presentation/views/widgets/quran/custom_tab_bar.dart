import 'package:flutter/material.dart';
import 'package:quraan_app/core/constants/colors.dart';
import 'package:quraan_app/core/constants/styles.dart';

// ignore: must_be_immutable
class CustomTabBar extends StatelessWidget {
  CustomTabBar({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Expanded(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: TabBar(
            labelPadding: const EdgeInsets.all(0),
            unselectedLabelColor: kBlackColor,
            unselectedLabelStyle: Styles.textStyle20,
            labelStyle: Styles.textStyle20,
            dividerColor: Colors.transparent,
            labelColor: kPrimaryColor,
            onTap: (value) {
              if (value == 0) {
                // ignore: avoid_print
                print("السور");
              } else if (value == 1) {
                // ignore: avoid_print
                print("الاجزاء");
              } else {
                // ignore: avoid_print
                print("الشيوخ");
              }
            },
            indicatorColor: Colors.transparent,
            controller: _tabController,
            tabs: tabs,
          ),
        ),
      ),
    );
  }

  List<Widget> tabs = [
    const Expanded(child: Tab(child: Text("السور"))),
    Expanded(
        child: Tab(
            child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 2,
          height: 35,
          color: kSecondaryColor,
        ),
        const Text("الأجزاء"),
        Container(
          width: 2,
          height: 35,
          color: kSecondaryColor,
        ),
      ],
    ))),
    const Expanded(child: Tab(child: Text("الشيوخ"))),
  ];
}
