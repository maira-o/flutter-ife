import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gauge_iot/app/data/model/Activity.dart';
import 'package:gauge_iot/app/routes/app_pages.dart';
import 'package:gauge_iot/app/utils/constants.dart';
import 'package:gauge_iot/app/utils/date_parser.dart';
import 'package:google_fonts/google_fonts.dart';
import 'child_activity_controller.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:get/get.dart';

class ChildActivityPage extends GetView<ChildActivityController> {
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
      body: GetX<ChildActivityController>(
        initState: controller.init(),
        builder: (_) {
          return _.isLoading
          ? Center(child: CircularProgressIndicator())
          : _body(context);
        },
      ),
    );
  }

  _body(BuildContext context) {
    return Styled.widget(
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: RefreshIndicator(
          onRefresh: () => controller.load(),
          child: _listView(context),
        )
      )
    ).padding(top: 16, left: 16, right: 16);
  }

  _listView(BuildContext context) {
    return ListView.builder(
      itemCount: controller.activities.length + 1,
      itemBuilder: (context, index) {
        if (index == 0 ) return _imageView(context);
        return _activityCell(controller.activities[index - 1]);
      },
    );
  }

  _imageView(BuildContext context) {
    return SizedBox(
      child: Image.asset(Assets.home_educador),
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.width * 0.8
    )
    .center();
  }

  _activityCell(Activity activity) {
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
      Get.toNamed(Routes.CHILD_ACTIVITY_DETAIL, arguments: activity);
    });
  }
}