
import 'package:flutter/material.dart';
import 'package:quraan_app/core/constants/assets.dart';

// ignore: camel_case_types
class logo extends StatelessWidget {
  const logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AssetsData.logo,
      width: MediaQuery.of(context).size.width * 0.2,
      fit: BoxFit.fill,
    );
  }
}
