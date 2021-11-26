import 'package:flutter/material.dart';
import 'package:gauge_iot/app/modules/child/activities/child_activity_page.dart';
import 'package:gauge_iot/app/modules/child/childHome/teacher_home_page.dart';
import 'package:gauge_iot/app/modules/teacher/activities/teacher_activity_page.dart';
import 'package:gauge_iot/app/modules/teacher/children/teacher_children_page.dart';
import 'package:gauge_iot/app/modules/teacher/home/teacher_home_page.dart';
import 'package:get/get.dart';

class ChildMainTabController extends GetxController {
  final _selectedIndex = 0.obs;
  get selectedIndex => this._selectedIndex.value;
  set selectedIndex(index) => this._selectedIndex.value = index;

  final List<Widget> pagesList = [
    ChildHomePage(),
    ChildActivityPage()
  ];
}