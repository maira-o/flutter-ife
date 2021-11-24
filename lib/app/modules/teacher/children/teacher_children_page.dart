import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gauge_iot/app/data/model/Child.dart';
import 'package:gauge_iot/app/routes/app_pages.dart';
import 'package:gauge_iot/app/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'teacher_children_controller.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:get/get.dart';

class TeacherChildrenPage extends GetView<TeacherChildrenController> {
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
      body: GetX<TeacherChildrenController>(
        initState: controller.init(),
        builder: (_) {
          return _.isLoading
          ? Center(child: CircularProgressIndicator())
          : _body(context);
        }
      )
      // body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Styled.widget(
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: RefreshIndicator(
          onRefresh: () => controller.load(),
          child: _listView(),
        )
      )
    ).padding(top: 16, left: 16, right: 16);
  }

  _listView() {
    return ListView.builder(
      itemCount: controller.children.length + 1,
      itemBuilder: (context, index) {
        if (index == 0 ) return _addNewChildButton();
        return _activityCell(controller.children[index - 1]);
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

  _activityCell(CriancaElement child) {
    int anoEscolar = child.crianca.anoEscolar;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(child.createAt.toString())
        .textColor(AppColors.primary900)
        .fontSize(10)
        .letterSpacing(1.5),
        Text(child.nome)
        .textColor(AppColors.secondary300)
        .fontSize(16),
        Text("Ano escolar: $anoEscolar")
        .textColor(AppColors.OnSurface)
        .fontSize(14),
        Divider(
          color: Colors.grey
        )
      ],
    );
  }
}