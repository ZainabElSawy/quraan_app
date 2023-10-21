import 'package:flutter/material.dart';
import 'package:quraan_app/core/constants/colors.dart';

ThemeData appTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor.withOpacity(0.1)),
  scaffoldBackgroundColor: kScaffoldColor,
  useMaterial3: true,
);
