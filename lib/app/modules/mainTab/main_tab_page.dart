import 'package:flutter/material.dart';
import 'main_tab_controller.dart';
import 'package:get/get.dart';

class MainTabPage extends StatelessWidget {
  final MainTabController controller = Get.put(MainTabController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
      bottomNavigationBar: Obx(() => _bottomNaviagtionBar()),
    );
  }

  _body() {
    return SafeArea(
      child: Obx(() {
        return IndexedStack(
          index: controller.selectedIndex, 
          children: controller.pagesList);
      }));
  }

  _bottomNaviagtionBar() {
    return BottomNavigationBar(
        currentIndex: controller.selectedIndex,
        onTap: _onTap,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home), label: "Início"),
          BottomNavigationBarItem(
            icon: Icon(Icons.list), label: "Alarmes"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Configurações")
        ]);
  }

  _onTap(int index) {
    controller.selectedIndex = index;
  }
}