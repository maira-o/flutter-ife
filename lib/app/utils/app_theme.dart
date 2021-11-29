import 'package:flutter/material.dart';
import 'package:gauge_iot/app/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData appThemeData = ThemeData(
  primaryColor: AppColors.primary,
  primaryColorDark: AppColors.primary,
  fontFamily: 'Baloo Paaji 2',
  textTheme: GoogleFonts.balooPaajiTextTheme(),
  focusColor: AppColors.primary,
  primarySwatch: Colors.orange,
  inputDecorationTheme: InputDecorationTheme(
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        style: BorderStyle.solid, 
        color: AppColors.primary
      ),
    ),
  ),
  progressIndicatorTheme: ProgressIndicatorThemeData(color: AppColors.primary),
  textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.primary,
      selectionColor: AppColors.primary,
      selectionHandleColor: AppColors.primary,
  )
);