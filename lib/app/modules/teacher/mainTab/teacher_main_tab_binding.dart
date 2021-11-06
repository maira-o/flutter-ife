import 'package:gauge_iot/app/modules/teacher/activities/teacher_activity_controller.dart';
import 'package:get/get.dart';

class TeacherMainTabBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeacherActivityController>(() => TeacherActivityController());
    // TODO: Controller para tela de Alarmes
    // TODO: Controller para tela de Configurações
  }
}
