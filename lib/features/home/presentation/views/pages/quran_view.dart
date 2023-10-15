import 'package:flutter/material.dart';
import 'package:quraan_app/core/constants/assets.dart';
import 'package:quraan_app/core/constants/colors.dart';
import 'package:quraan_app/core/constants/styles.dart';

class QuranView extends StatefulWidget {
  const QuranView({super.key});

  @override
  State<QuranView> createState() => _QuranViewState();
}

class _QuranViewState extends State<QuranView>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              Image.asset(
                AssetsData.logo,
                width: MediaQuery.of(context).size.width * 0.2,
                fit: BoxFit.fill,
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Expanded(
                    child: TabBar(
                      labelPadding: const EdgeInsets.all(0),
                      unselectedLabelColor: kBlackColor,
                      unselectedLabelStyle: Styles.textStyle20,
                      labelStyle: Styles.textStyle20,
                      dividerColor: Colors.transparent,
                      labelColor: kPrimaryColor,
                      onTap: (value) {
                        if (value == 0) {
                          //BlocProvider.of<AuthCubit>(context).showLogin();
                        } else {
                          //BlocProvider.of<AuthCubit>(context).showSignUp();
                        }
                      },
                      indicatorColor: Colors.transparent,
                      controller: _tabController,
                      tabs: [
                        const Expanded(child: Tab(child: Text("الشيوخ"))),
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
                        const Expanded(
                            child: Tab(
                          child: Text("السور"),
                        )),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
