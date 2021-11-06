import 'package:flutter/material.dart';
import 'package:gauge_iot/app/modules/home/home_page.dart';
import 'package:get/get.dart';

class MainTabController extends GetxController {
  final _selectedIndex = 0.obs;
  get selectedIndex => this._selectedIndex.value;
  set selectedIndex(index) => this._selectedIndex.value = index;

  final List<Widget> pagesList = [
    Center(child: Text("Tab 1")),
    
    Center(child: Text("Tab 2")),
    
    Center(child: Text("Tab 3")),
  ];
}