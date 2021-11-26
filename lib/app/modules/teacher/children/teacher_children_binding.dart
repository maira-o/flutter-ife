import 'package:get/get.dart';
import 'teacher_children_controller.dart';

class TeacherChildrenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeacherChildrenController>(() {
      return TeacherChildrenController();
    });
  }
}
