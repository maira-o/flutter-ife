import 'package:flutter/material.dart';
import 'package:gauge_iot/app/utils/constants.dart';
import 'teacher_addActivity_controller.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:get/get.dart';

class TeacherAddActivityPage extends GetView<TeacherAddActivityController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Atividade")
                .textColor(Colors.white),
        centerTitle: false,
        backgroundColor: AppColors.primary
      ),
      extendBody: true,
      body: GetX<TeacherAddActivityController>(
            init: controller.init(),
            builder: (_) {
              return _.isLoading
              ? Center(child: CircularProgressIndicator())
              : _body(context);
            },
          ),
    );
  }

  _body(BuildContext context) {
    return Column(
      children: [
        _form(context),
        SizedBox(height: 24),
        _button(context),
      ],
    ).padding(vertical: 30, horizontal: 16);
  }

  _form(BuildContext context) {
    return Expanded(
      child: Container(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: _formFields()
          )
        ),
      ),
    );
  }

  _formFields() {
    return Column(
      children: [
        _activityTitle(),
        SizedBox(height: 16),
        _obsTextField(),
        SizedBox(height: 16),
        _selectChildrenWidget(),
      ]
    );
  }

  _activityTitle() {
    return TextField(
      style: TextStyle(
        fontSize: 16,
        height: 1.0,
      ),
      decoration: InputDecoration(
        labelText: "Título da atividade",
        helperText: "Digite o título da atividade",
        helperStyle: TextStyle(
          color: Colors.black38,
          fontSize: 12,
          height: 0.8
        ),
        border: OutlineInputBorder()
      ),
      onChanged: (text) {
        controller.activityTitle = text;
        controller.validateForm();
      }
    );
  }

  _obsTextField() {
    return TextField(
      textAlignVertical: TextAlignVertical.top,
      minLines: 4,
      maxLines: null,
      style: TextStyle(
        fontSize: 16,
        height: 1.0,
      ),
      decoration: InputDecoration(
        labelText: "Descrição da atividade",
        helperText: "Digite aqui o conteúdo da atividade",
        helperStyle: TextStyle(
          color: Colors.black38,
          fontSize: 12,
          height: 0.8
        ),
        border: OutlineInputBorder()
      ),
      onChanged: (text) {
        controller.activityDescription = text;
        controller.validateForm();
      }
    );
  }

  _selectChildrenWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Selecione as crianças:")
          .textColor(AppColors.secondary300)
          .fontSize(20),

        for (int i = 0; i < controller.children.length; i++)
          new CheckboxListTile(
            contentPadding: EdgeInsets.symmetric(),
            activeColor: AppColors.primary,
            title: Text(controller.selectableChild[i].name)
              .textColor(AppColors.OnSurface)
              .fontSize(14),
            controlAffinity: ListTileControlAffinity.trailing,
            value: controller.selectableChild[i].isSelected.value,
            onChanged: (value) => controller.selectChild(i, value ?? false)
          )
      ]
    );
  }

  _button(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (!controller.isFormValid) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text("Complete o form para continuar")
                            .fontSize(24)
                            .fontWeight(FontWeight.bold)
                            
              )
            );
        } else {
          controller.addChild((success) {
            if (success) {
              Get.back();
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  content: Text("Ocorreu Algum erro")
                            .fontSize(24)
                            .fontWeight(FontWeight.bold)
                )
              );
            }
          });
        }
      }, 
      style: ElevatedButton.styleFrom(
        primary: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        )
      ),
      child: Text("adicionar nova atividade".toUpperCase())
              .textColor(Colors.white)
    )
    .width(double.infinity)
    .height(40);
  }
}