import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quraan_app/core/constants/assets.dart';
import 'package:quraan_app/core/constants/colors.dart';

// ignore: must_be_immutable
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _page = 0;

  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      extendBody: true,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_page.toString(), textScaleFactor: 10.0),
            ElevatedButton(
              child: const Text('Go To Page of index 1'),
              onPressed: () {
                final CurvedNavigationBarState? navBarState =
                    _bottomNavigationKey.currentState;
                navBarState?.setPage(1);
              },
            )
          ],
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(iconTheme: const IconThemeData(color: Colors.white)),
        child: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          height: 60.0,
          items: <Widget>[
            const Icon(Icons.home, size: 30),
            const Icon(Icons.favorite, size: 30),
            Image.asset(
              AssetsData.quranLogo,
              width: 30,
              height: 30,
              fit: BoxFit.fill,
            ),
            //Icon(, size: 30),
            const Icon(Icons.explore, size: 30),
            const Icon(Icons.waving_hand, size: 30),
          ],
          color: kPrimaryColor,
          buttonBackgroundColor: kPrimaryColor,
          backgroundColor: Colors.transparent,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
          letIndexChange: (index) => true,
        ),
      ),
    ));
  }
}
