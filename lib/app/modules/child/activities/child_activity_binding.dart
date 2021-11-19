import 'package:get/get.dart';
import 'child_activity_controller.dart';

class ChildActivityBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChildActivityController>(() {
      return ChildActivityController();
    });
  }
}
