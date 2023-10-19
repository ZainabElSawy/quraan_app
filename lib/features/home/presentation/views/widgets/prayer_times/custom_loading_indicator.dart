import 'package:flutter/material.dart';
import 'package:quraan_app/core/constants/colors.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator(color: kPrimaryColor));
  }
}
