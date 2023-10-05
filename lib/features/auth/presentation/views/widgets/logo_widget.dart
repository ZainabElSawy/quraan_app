import 'package:flutter/material.dart';
import 'package:quraan_app/core/constants/assets.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AssetsData.logo,
      width: MediaQuery.of(context).size.width * 0.28,
      fit: BoxFit.fill,
    );
  }
}