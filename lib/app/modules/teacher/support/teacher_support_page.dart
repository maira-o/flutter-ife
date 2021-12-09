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
          child: _supportCell(index)
                  .padding(top: 16, left: 16, right: 16),
          onDismissed: (_) {
            controller.deleteSupport(controller.supports[index], (responseSuccess) {
              if (responseSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    elevation: 6.0,
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.green,
                    content: Text("Sucesso ao excluir o apoio")
                              .fontSize(24)
                              .fontWeight(FontWeight.bold)
                  )
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    elevation: 6.0,
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.red,
                    content: Text("Ocorreu Algum erro ao excluir o apoio")
                              .fontSize(24)
                              .fontWeight(FontWeight.bold)
                  )
                );
              }
            });
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

  Widget _supportCell(int index) {
    return Column(
      children: [
        Row(children: [
          Column(
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
            ],
          )
          .expanded(),
          _supportValueWidget(controller.supports[index].valor),
        ]),
        Divider(
            color: Colors.grey
        )
      ],
    );
  }

  _supportValueWidget(double value) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: Row(
        children: [
          SizedBox(width: 8),
          Icon(Icons.favorite, color: AppColors.secondary900),
          SizedBox(width: 8),
          Text("R\$ $value"),
          SizedBox(width: 8),
        ],
      )
      .padding(all: 8)  
      .backgroundColor(AppColors.secondary50)
    );
  }
}