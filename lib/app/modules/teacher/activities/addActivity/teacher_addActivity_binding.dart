import 'package:get/get.dart';
import 'teacher_addActivity_controller.dart';

class TeacherAddActivityBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeacherAddActivityController>(() {
      return TeacherAddActivityController();
    });
  }
}
