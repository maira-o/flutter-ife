import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gauge_iot/app/data/model/Activity.dart';
import 'package:gauge_iot/app/routes/app_pages.dart';
import 'package:gauge_iot/app/utils/constants.dart';
import 'package:gauge_iot/app/utils/date_parser.dart';
import 'package:google_fonts/google_fonts.dart';
import 'support_controller.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:get/get.dart';

class SupportPage extends GetView<SupportController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Apoios")
                .textColor(Colors.white),
        centerTitle: false,
        backgroundColor: AppColors.primary
      ),
      extendBody: true,
      body: GetX<SupportController>(
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
      itemCount: controller.supports.length + 1,
      itemBuilder: (context, index) {
        if (index == 0 ) return _imageView(context);
        return _activityCell(index - 1);
      },
    );
  }

  _imageView(BuildContext context) {
    return SizedBox(
      child: Image.asset(Assets.home_crianca),
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.width * 0.8
    )
    .center();
  }

  Widget _activityCell(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(DateParser.convertToDate(controller.supports[index].createAt.toString()))
        .textColor(AppColors.primary900)
        .fontSize(10)
        .letterSpacing(1.5),
        Text("${controller.children[index].usuario.nome}")
        .textColor(AppColors.secondary300)
        .fontSize(16),
        Text("${controller.children[index].usuario.crianca.cidade}", maxLines: 1)
        .textColor(AppColors.OnSurface)
        .fontSize(14),
        Divider(
          color: Colors.grey
        )
      ],
    )
    .onTap(() { 
      Get.toNamed(
        Routes.SUPPORT_DETAIL, 
        arguments: [controller.supports[index], controller.children[index]]
      );
    });
  }
}