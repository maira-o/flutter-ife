import 'package:flutter/material.dart';
import 'package:gauge_iot/app/routes/app_pages.dart';
import 'package:gauge_iot/app/utils/app_theme.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.LANDING,
    theme: appThemeData,
    defaultTransition: Transition.fade,
    getPages: AppPages.pages,
  ));
}
