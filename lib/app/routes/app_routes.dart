part of './app_pages.dart';

abstract class Routes {
  // GENERIC ROUTES
  static const INITIAL = '/';
  static const LANDING = '/landing';

  // TEACHER ROUTES
  static const TEACHER_TAB = '/teacher/tab';
  static const TEACHER_HOME = '/teacher/home';
  static const TEACHER_ACTIVITY = '/teacher/activity';
  static const TEACHER_ADD_ACTIVITY = '/teacher/activity/add';
  static const TEACHER_CHILDREN = '/teacher/children';
  static const TEACHER_ADD_CHILD = '/teacher/children/add';

  // CHILD ROUTES
  static const CHILD_TAB = '/child/tab';
  static const CHILD_HOME = '/child/home';
  static const CHILD_ACTIVITIES = '/child/activity';
  static const CHILD_ACTIVITY_DETAIL = '/child/activity/detail';

  // SUPPORTER ROUTES
  static const SUPPORTER_TAB = '/supporter/tab';
  static const SUPPORTER_HOME = '/supporter/home';
  static const SUPPORTER_SUPPORTS = '/supporter/supports';
  static const SUPPORT_DETAIL = '/supporter/supports/detail';
}