import 'package:flutter/material.dart';
import 'package:gauge_iot/app/utils/constants.dart';
import 'package:gauge_iot/app/utils/date_parser.dart';
import 'teacher_support_controller.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:get/get.dart';

class TeacherSupportPage extends GetView<TeacherSupportController> {
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
      body: GetX<TeacherSupportController>(
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
      )
    );
  }

  _listView() {
    return ListView.builder(
      itemCount: controller.supports.length,
      itemBuilder: (context, index) {
        return Dismissible(
          direction: DismissDirection.endToStart,
          key: UniqueKey(), 
          child: _activityCell(index)
                  .padding(top: 16, left: 16),
          onDismissed: (_) {
            controller.deleteSupport(index);
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
    );
  }
}