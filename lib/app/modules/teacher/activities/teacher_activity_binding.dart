import 'package:get/get.dart';
import 'teacher_activity_controller.dart';

class TeacherActivityBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeacherActivityController>(() {
      return TeacherActivityController();
    });
  }
}
