import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gauge_iot/app/routes/app_pages.dart';
import 'package:gauge_iot/app/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'teacher_children_controller.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:get/get.dart';

class TeacherChildrenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crianças")
                .textColor(Colors.white),
        centerTitle: false,
        backgroundColor: AppColors.primary
      ),
      extendBody: true,
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Styled.widget(
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: _listView()
      )
    ).padding(top: 16, left: 16, right: 16);
  }

  _listView() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        if (index == 0 ) return _addNewChildButton();
        return _activityCell();
      },
    );
  }

  _addNewChildButton() {
    return ElevatedButton.icon(
      onPressed: () => Get.toNamed(Routes.TEACHER_ADD_CHILD), 
      icon: Icon(Icons.add, color: AppColors.secondary900), 
      style: ElevatedButton.styleFrom(
        primary: AppColors.secondary100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        )
      ),
      label: Text("adicionar nova criança".toUpperCase())
              .textColor(AppColors.secondary900)
              .padding(vertical: 10)
    ).padding(left: 16, right: 16, bottom: 16);
  }

  _activityCell() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("30/09/2021")
        .textColor(AppColors.primary900)
        .fontSize(10)
        .letterSpacing(1.5),
        Text("Carolina Dias")
        .textColor(AppColors.secondary300)
        .fontSize(16),
        Text("09 anos")
        .textColor(AppColors.OnSurface)
        .fontSize(14),
        Divider(
          color: Colors.grey
        )
      ],
    );
  }
}