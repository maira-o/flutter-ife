import 'package:flutter/material.dart';
import 'package:gauge_iot/app/data/provider/Storage.dart';
import 'package:gauge_iot/app/modules/teacher/activities/teacher_activity_page.dart';
import 'package:gauge_iot/app/modules/teacher/children/teacher_children_page.dart';
import 'package:gauge_iot/app/modules/teacher/home/teacher_home_page.dart';
import 'package:gauge_iot/app/utils/constants.dart';
import 'package:get/get.dart';

class TeacherMainTabController extends GetxController {
  final _selectedIndex = 0.obs;
  get selectedIndex => this._selectedIndex.value;
  set selectedIndex(index) => this._selectedIndex.value = index;

  TeacherMainTabController() {
    _printToken();
  }

  _printToken() async {
    String token = await SensitiveStorage().readValue(StorageValues.loginToken);
    print("TOKEN NO SENSITIVE STORAGE: " + token);
  }

  final List<Widget> pagesList = [
    TeacherHomePage(),

    TeacherActivityPage(),
    
    TeacherChildrenPage(),
  ];
}