import 'package:flutter/material.dart';
import 'package:gauge_iot/app/modules/supporter/supporterHome/supporter_home_page.dart';
import 'package:gauge_iot/app/modules/supporter/supports/support_page.dart';
import 'package:get/get.dart';

class SupporterMainTabController extends GetxController {
  final _selectedIndex = 0.obs;
  get selectedIndex => this._selectedIndex.value;
  set selectedIndex(index) => this._selectedIndex.value = index;

  final List<Widget> pagesList = [
    SupporterHomePage(),
    SupportPage()
  ];
}