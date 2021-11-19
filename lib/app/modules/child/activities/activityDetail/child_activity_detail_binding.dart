import 'package:get/get.dart';
import 'child_activity_detail_controller.dart';

class ChildActivityDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChildActivityDetailController>(() {
      return ChildActivityDetailController();
    });
  }
}
