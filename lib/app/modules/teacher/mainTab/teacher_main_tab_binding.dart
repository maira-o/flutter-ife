import 'package:gauge_iot/app/modules/teacher/activities/teacher_activity_controller.dart';
import 'package:gauge_iot/app/modules/teacher/children/teacher_children_controller.dart';
import 'package:gauge_iot/app/modules/teacher/support/teacher_support_controller.dart';
import 'package:get/get.dart';

class TeacherMainTabBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeacherActivityController>(() => TeacherActivityController());
    Get.lazyPut<TeacherChildrenController>(() => TeacherChildrenController());
    Get.lazyPut<TeacherSupportController>(() => TeacherSupportController());
  }
}
