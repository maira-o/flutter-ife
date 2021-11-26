import 'package:flutter/material.dart';
import 'package:gauge_iot/app/utils/constants.dart';
import 'supporter_main_tab_controller.dart';
import 'package:get/get.dart';

class SupporterMainTabPage extends StatelessWidget {
  final SupporterMainTabController controller = Get.put(SupporterMainTabController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _body(),
      bottomNavigationBar: Obx(() => _bottomNaviagtionBar()),
    );
  }

  _body() {
    return Obx(() {
        return IndexedStack(
          index: controller.selectedIndex, 
          children: controller.pagesList);
    });
  }

  _bottomNaviagtionBar() {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      child: BottomNavigationBar(
        currentIndex: controller.selectedIndex,
        onTap: _onTap,
        backgroundColor: AppColors.primary,
        selectedItemColor: Colors.white,
        unselectedItemColor: AppColors.primary50,
        elevation: 1,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite), label: "Início"),
          BottomNavigationBarItem(
            icon: Icon(Icons.tag_faces), label: "Crianças"),
        ]
      ),
    );
  }

  _onTap(int index) {
    controller.selectedIndex = index;
  }
}