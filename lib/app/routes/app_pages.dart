import 'package:gauge_iot/app/modules/landing/landing_binding.dart';
import 'package:gauge_iot/app/modules/landing/landing_page.dart';
import 'package:gauge_iot/app/modules/mainTab/main_tab_binding.dart';
import 'package:gauge_iot/app/modules/mainTab/main_tab_page.dart';
import 'package:get/get.dart';

part './app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: Routes.LANDING,
        page: () => LandingPage(),
        binding: LandingBinding()
    ),
    GetPage(
      name: Routes.TAB, 
      page: () => MainTabPage(),
      binding: MainTabBinding()
    ),
  ];
}
