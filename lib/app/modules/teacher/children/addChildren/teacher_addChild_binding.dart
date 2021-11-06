import 'package:get/get.dart';
import 'teacher_addChild_controller.dart';

class TeacherAddChildBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeacherAddChildController>(() {
      return TeacherAddChildController();
    });
  }
}
