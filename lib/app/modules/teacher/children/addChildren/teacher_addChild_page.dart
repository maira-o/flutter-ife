import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gauge_iot/app/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'teacher_addChild_controller.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:get/get.dart';

class TeacherAddChildPage extends StatelessWidget {
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
      // body: _body(context),
      body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child:  _body(context)
      ),
    );
  }

  _body(BuildContext context) {
    return Column(
      children: [
        _form(context),
        SizedBox(height: 24),
        _button(),
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
        _nameTextField(),
        SizedBox(height: 16),
        _ageTextField(),
        SizedBox(height: 16),
        _schoolYearTextField(),
        SizedBox(height: 16),
        _cityTextField(),
      ]
    );
  }

  _nameTextField() {
    return TextField(
      style: TextStyle(
        fontSize: 16,
        height: 1.0,
      ),
      decoration: InputDecoration(
        labelText: "Nome",
        helperText: "Digite o nome da criança",
        helperStyle: TextStyle(
          color: Colors.black38,
          fontSize: 12,
          height: 0.8
        ),
        border: OutlineInputBorder()
      ),
    );
  }

    _ageTextField() {
    return TextField(
      style: TextStyle(
        fontSize: 16,
        height: 1.0,
      ),
      decoration: InputDecoration(
        labelText: "Idade",
        helperText: "Digite a idade da criança",
        helperStyle: TextStyle(
          color: Colors.black38,
          fontSize: 12,
          height: 0.8
        ),
        border: OutlineInputBorder()
      ),
    );
  }

    _schoolYearTextField() {
    return TextField(
      style: TextStyle(
        fontSize: 16,
        height: 1.0,
      ),
      decoration: InputDecoration(
        labelText: "Ano escolar",
        helperText: "Digite o ano escolar atual",
        helperStyle: TextStyle(
          color: Colors.black38,
          fontSize: 12,
          height: 0.8
        ),
        border: OutlineInputBorder()
      ),
    );
  }

    _cityTextField() {
    return TextField(
      style: TextStyle(
        fontSize: 16,
        height: 1.0,
      ),
      decoration: InputDecoration(
        labelText: "Cidade",
        helperText: "Digite a cidade de residência",
        helperStyle: TextStyle(
          color: Colors.black38,
          fontSize: 12,
          height: 0.8
        ),
        border: OutlineInputBorder()
      ),
    );
  }

  _button() {
    return ElevatedButton(
      onPressed: () => print("apertou no botao de adicionar crianca"), 
      style: ElevatedButton.styleFrom(
        primary: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        )
      ),
      child: Text("adicionar nova criança".toUpperCase())
              .textColor(Colors.white)
    )
    .width(double.infinity)
    .height(40);
  }
}