import 'package:get/get.dart';
import 'teacher_support_controller.dart';

class TeacherSupportBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeacherSupportController>(() {
      return TeacherSupportController();
    });
  }
}
