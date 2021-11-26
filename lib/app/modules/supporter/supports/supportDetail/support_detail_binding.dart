import 'package:get/get.dart';
import 'support_detail_controller.dart';

class SupportDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SupportDetailController>(() {
      return SupportDetailController();
    });
  }
}
