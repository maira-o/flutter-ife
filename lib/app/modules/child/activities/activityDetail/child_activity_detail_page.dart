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
        _activityInfos(context),
        SizedBox(height: 16),
        _emotionsRow(),
        SizedBox(height: 30)
      ]
    );
  }

  _activityInfos(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(controller.title)
            .textColor(AppColors.secondary300)
            .fontSize(24),
            Text(controller.date)
            .textColor(AppColors.primary900)
            .fontSize(16),
            SelectableText(controller.description, style: TextStyle(fontSize: 16))
          ],
        )
        .padding(vertical: 30, horizontal: 16)
      )
    );
  }

  _emotionsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _emotionWidget(Assets.like_icon, false, () => {}),
        _emotionWidget(Assets.lingua_icon, false, () => {}),
        _emotionWidget(Assets.coracao_icon, true, () => {}),
        _emotionWidget(Assets.choro_icon, false, () => {}),
        _emotionWidget(Assets.surpresa_icon, false, () => {}),
        _emotionWidget(Assets.brabo_icon, false, () => {}),
      ]
    );
  }

  _emotionWidget(String icon, bool isSelected, Function didTap) {
    return Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? AppColors.secondary100 : null,
        ),
        child: Image.asset(icon).padding(all: 4)
    );
  }
}