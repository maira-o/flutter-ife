import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gauge_iot/app/data/model/Activity.dart';
import 'package:gauge_iot/app/routes/app_pages.dart';
import 'package:gauge_iot/app/utils/constants.dart';
import 'package:gauge_iot/app/utils/date_parser.dart';
import 'package:google_fonts/google_fonts.dart';
import 'teacher_activity_controller.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:get/get.dart';

class TeacherActivityPage extends GetView<TeacherActivityController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Atividades")
                .textColor(Colors.white),
        centerTitle: false,
        backgroundColor: AppColors.primary
      ),
      extendBody: true,
      body: GetX<TeacherActivityController>(
        initState: controller.init(),
        builder: (_) {
          return _.isLoading
          ? Center(child: CircularProgressIndicator())
          : _body(context);
        }
      ),
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
        // child: _listView()
      )
    ).padding(top: 16, left: 16);
  }

  _listView() {
    return ListView.builder(
      itemCount: controller.activities.length + 1,
      itemBuilder: (context, index) {
        if (index == 0 ) return _addNewActivityButton();
        return Dismissible(
          direction: DismissDirection.endToStart,
          key: UniqueKey(), 
          child: _activityCell(controller.activities[index - 1]),
          onDismissed: (_) {
            controller.deleteActyivity(index);
          },
          background: Container(
            color: Colors.red,
            alignment: Alignment.centerRight,
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }

  _addNewActivityButton() {
    return ElevatedButton.icon(
      onPressed: () {
        controller.selectedActivity = null;
        Get.toNamed(Routes.TEACHER_ADD_ACTIVITY);
      }, 
      icon: Icon(Icons.add, color: AppColors.secondary900), 
      style: ElevatedButton.styleFrom(
        primary: AppColors.secondary100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        )
      ),
      label: Text("adicionar nova atividade".toUpperCase())
              .textColor(AppColors.secondary900)
              .padding(vertical: 10)
    ).padding(left: 16, right: 16, bottom: 16);
  }

  Widget _activityCell(Activity activity) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(DateParser.convertToDate(activity.createAt.toString()))
        .textColor(AppColors.primary900)
        .fontSize(10)
        .letterSpacing(1.5),
        Text(activity.titulo)
        .textColor(AppColors.secondary300)
        .fontSize(16),
        Text(activity.descricao, maxLines: 1)
        .textColor(AppColors.OnSurface)
        .fontSize(14),
        Divider(
          color: Colors.grey
        )
      ],
    )
    .onTap(() {
      controller.selectedActivity = activity;
      Get.toNamed(Routes.TEACHER_ADD_ACTIVITY);
    });
  }
}