import 'package:flutter/material.dart';
import 'package:gauge_iot/app/modules/teacher/activities/teacher_activity_page.dart';
import 'package:gauge_iot/app/modules/teacher/children/teacher_children_page.dart';
import 'package:get/get.dart';

class TeacherMainTabController extends GetxController {
  final _selectedIndex = 0.obs;
  get selectedIndex => this._selectedIndex.value;
  set selectedIndex(index) => this._selectedIndex.value = index;

  final List<Widget> pagesList = [
    Center(child: Text("Tab 1")),

    TeacherActivityPage(),
    
    TeacherChildrenPage(),
  ];
}