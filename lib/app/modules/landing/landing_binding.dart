import 'package:gauge_iot/app/modules/landing/landing_controller.dart';
import 'package:get/get.dart';

class LandingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LandingController>(() {
      return LandingController();
    });
  }
}
