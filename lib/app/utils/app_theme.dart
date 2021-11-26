import 'package:flutter/material.dart';
import 'package:gauge_iot/app/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData appThemeData = ThemeData(
  primaryColor: AppColors.primary,
  fontFamily: 'Baloo Paaji 2',
  textTheme: GoogleFonts.balooPaajiTextTheme(),
  progressIndicatorTheme: ProgressIndicatorThemeData(color: AppColors.primary)
);