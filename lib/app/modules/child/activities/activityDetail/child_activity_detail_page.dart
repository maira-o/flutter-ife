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
          child: GetX<ChildActivityDetailController>(
            builder: (_) {
              return _body(context);
            },
          ),
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
      children: _getEmotionsWidgets()
    );
  }

  List<Widget> _getEmotionsWidgets() {
    List<Widget> emotionList = [];

    for (var emotion in controller.emotions) {
      emotionList.add(_emotionWidget(emotion));
    }

    return emotionList;
  }

  _emotionWidget(Emotion emotion) {
    return Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: emotion.isSelected.value? AppColors.secondary100 : null,
        ),
        child: Image.asset(emotion.icon).padding(all: 4)
    )
    .onTap(() {
      controller.selectEmotion(emotion.id);
    });
  }
}