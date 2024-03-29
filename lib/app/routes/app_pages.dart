import 'package:gauge_iot/app/modules/child/activities/activityDetail/child_activity_detail_binding.dart';
import 'package:gauge_iot/app/modules/child/activities/activityDetail/child_activity_detail_page.dart';
import 'package:gauge_iot/app/modules/child/activities/child_activity_binding.dart';
import 'package:gauge_iot/app/modules/child/activities/child_activity_page.dart';
import 'package:gauge_iot/app/modules/child/childHome/teacher_home_page.dart';
import 'package:gauge_iot/app/modules/child/mainTab/child_main_tab_binding.dart';
import 'package:gauge_iot/app/modules/child/mainTab/child_main_tab_page.dart';
import 'package:gauge_iot/app/modules/landing/landing_binding.dart';
import 'package:gauge_iot/app/modules/landing/landing_page.dart';
import 'package:gauge_iot/app/modules/supporter/mainTab/supporter_main_tab_binding.dart';
import 'package:gauge_iot/app/modules/supporter/mainTab/supporter_main_tab_page.dart';
import 'package:gauge_iot/app/modules/supporter/supporterHome/supporter_home_page.dart';
import 'package:gauge_iot/app/modules/supporter/supports/supportDetail/support_detail_binding.dart';
import 'package:gauge_iot/app/modules/supporter/supports/supportDetail/support_detail_page.dart';
import 'package:gauge_iot/app/modules/supporter/supports/support_binding.dart';
import 'package:gauge_iot/app/modules/supporter/supports/support_page.dart';
import 'package:gauge_iot/app/modules/teacher/activities/addActivity/teacher_addActivity_binding.dart';
import 'package:gauge_iot/app/modules/teacher/activities/addActivity/teacher_addActivity_page.dart';
import 'package:gauge_iot/app/modules/teacher/activities/teacher_activity_binding.dart';
import 'package:gauge_iot/app/modules/teacher/activities/teacher_activity_page.dart';
import 'package:gauge_iot/app/modules/teacher/children/addChildren/teacher_addChild_binding.dart';
import 'package:gauge_iot/app/modules/teacher/children/addChildren/teacher_addChild_page.dart';
import 'package:gauge_iot/app/modules/teacher/children/teacher_children_binding.dart';
import 'package:gauge_iot/app/modules/teacher/children/teacher_children_page.dart';
import 'package:gauge_iot/app/modules/teacher/home/teacher_home_page.dart';
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
      name: Routes.TEACHER_HOME, 
      page: () => TeacherHomePage()
    ),
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
      name: Routes.TEACHER_ADD_ACTIVITY, 
      page: () => TeacherAddActivityPage(),
      binding: TeacherAddActivityBinding()
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
    GetPage(
      name: Routes.CHILD_TAB, 
      page: () => ChildMainTabPage(),
      binding: ChildMainTabBinding()
    ),
    GetPage(
      name: Routes.CHILD_HOME, 
      page: () => ChildHomePage(),
    ),
    GetPage(
      name: Routes.CHILD_ACTIVITIES, 
      page: () => ChildActivityPage(),
      binding: ChildActivityBinding()
    ),
    GetPage(
      name: Routes.CHILD_ACTIVITY_DETAIL, 
      page: () => ChildActivityDetailPage(),
      binding: ChildActivityDetailBinding()
    ),

    // SUPPORTER PAGES
    GetPage(
      name: Routes.SUPPORTER_TAB, 
      page: () => SupporterMainTabPage(),
      binding: SupporterMainTabBinding()
    ),
    GetPage(
      name: Routes.SUPPORTER_HOME, 
      page: () => SupporterHomePage()
    ),
    GetPage(
      name: Routes.SUPPORTER_SUPPORTS, 
      page: () => SupportPage(),
      binding: SupportBinding()
    ),
    GetPage(
      name: Routes.SUPPORT_DETAIL, 
      page: () => SupportDetailPage(),
      binding: SupportDetailBinding()
    ),
  ];
}
