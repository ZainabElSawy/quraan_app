import 'package:flutter/material.dart';
import 'package:quraan_app/core/constants/assets.dart';

class FacebookLogo extends StatelessWidget {
  const FacebookLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AssetsData.facebookLogo,
      width: 20,
      height: 20,
      fit: BoxFit.fill,
    );
  }
}
