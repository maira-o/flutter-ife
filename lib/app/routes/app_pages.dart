import 'package:gauge_iot/app/modules/landing/landing_binding.dart';
import 'package:gauge_iot/app/modules/landing/landing_page.dart';
import 'package:gauge_iot/app/modules/teacher/activities/teacher_activity_binding.dart';
import 'package:gauge_iot/app/modules/teacher/activities/teacher_activity_page.dart';
import 'package:gauge_iot/app/modules/teacher/children/addChildren/teacher_addChild_binding.dart';
import 'package:gauge_iot/app/modules/teacher/children/addChildren/teacher_addChild_page.dart';
import 'package:gauge_iot/app/modules/teacher/children/teacher_children_binding.dart';
import 'package:gauge_iot/app/modules/teacher/children/teacher_children_controller.dart';
import 'package:gauge_iot/app/modules/teacher/children/teacher_children_page.dart';
import 'package:gauge_iot/app/modules/teacher/mainTab/teacher_main_tab_binding.dart';
import 'package:gauge_iot/app/modules/teacher/mainTab/teacher_main_tab_page.dart';
import 'package:get/get.dart';

part './app_routes.dart';

class AppPages {
  static final pages = [
    // GENERIC PAGES
    GetPage(
        name: Routes.LANDING,
        page: () => LandingPage(),
        binding: LandingBinding()
    ),

    // TEACHER PAGES
    GetPage(
      name: Routes.TEACHER_TAB, 
      page: () => TeacherMainTabPage(),
      binding: TeacherMainTabBinding()
    ),
    GetPage(
      name: Routes.TEACHER_ACTIVITY, 
      page: () => TeacherActivityPage(),
      binding: TeacherActivityBinding()
    ),
    GetPage(
      name: Routes.TEACHER_CHILDREN, 
      page: () => TeacherChildrenPage(),
      binding: TeacherChildrenBinding()
    ),
    GetPage(
      name: Routes.TEACHER_ADD_CHILD, 
      page: () => TeacherAddChildPage(),
      binding: TeacherAddChildBinding()
    ),
    // CHILD PAGES

    // SUPPORTER PAGES
  ];
}
