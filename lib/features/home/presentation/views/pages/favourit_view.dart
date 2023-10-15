import 'package:flutter/material.dart';
import 'package:quraan_app/core/constants/colors.dart';
import 'package:quraan_app/core/constants/styles.dart';

class FavouritView extends StatelessWidget {
  const FavouritView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "لا توجد مفضلات",
        style: Styles.textStyle30.copyWith(color: kSecondaryColor),
        //textDirection: TextDirection.rtl,
      ),
    );
  }
}
