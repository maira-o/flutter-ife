import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gauge_iot/app/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'child_activity_detail_controller.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:get/get.dart';

class ChildActivityDetailPage extends GetView<ChildActivityDetailController> {
  const ChildActivityDetailPage({Key? key}) : super(key: key);

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
      // body: _body(context),
      body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: _body(context),
          // child: GetX<ChildActivityDetailController>(
          //   builder: (_) {
          //     return _body(context);
          //   },
          // ),
      ),
    );
  }

  _body(BuildContext context) {
    return Column(
      children: [
        Text(controller.title)
        .textColor(AppColors.secondary300)
        .fontSize(24),
        Text(controller.date)
        .textColor(AppColors.primary900)
        .fontSize(16),
        Text(controller.description)
        .fontSize(16),
      ],
    ).padding(vertical: 30, horizontal: 16);
  }
}