import 'package:gauge_iot/app/modules/child/activities/child_activity_controller.dart';
import 'package:gauge_iot/app/modules/supporter/supports/support_controller.dart';
import 'package:gauge_iot/app/modules/teacher/activities/teacher_activity_controller.dart';
import 'package:get/get.dart';

class SupporterMainTabBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SupportController>(() => SupportController());
  }
}
