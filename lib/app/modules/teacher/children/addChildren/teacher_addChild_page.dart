import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gauge_iot/app/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'teacher_addChild_controller.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:get/get.dart';

class TeacherAddChildPage extends StatelessWidget {
  const TeacherAddChildPage({Key? key}) : super(key: key);

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
          child: GetX<TeacherAddChildController>(
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
    TeacherAddChildController controller = Get.find<TeacherAddChildController>();
    return Column(
      children: [
        _nameTextField(),
        SizedBox(height: 16),
        _ageTextField(),
        SizedBox(height: 16),
        _schoolYearTextField(),
        SizedBox(height: 16),
        _cityTextField(),
        SizedBox(height: 16),
        _contactTextField(),
        SizedBox(height: 16),
        _obsTextField(),
        SizedBox(height: 16),
        _readingLevel(controller),
        SizedBox(height: 16),
        _supportWidget(controller),
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

   _contactTextField() {
    return TextField(
      style: TextStyle(
        fontSize: 16,
        height: 1.0,
      ),
      decoration: InputDecoration(
        labelText: "Contato",
        helperText: "Digite as informações de contato",
        helperStyle: TextStyle(
          color: Colors.black38,
          fontSize: 12,
          height: 0.8
        ),
        border: OutlineInputBorder()
      ),
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
        labelText: "Observações",
        helperText: "Digite aqui observações complementares",
        helperStyle: TextStyle(
          color: Colors.black38,
          fontSize: 12,
          height: 0.8
        ),
        border: OutlineInputBorder()
      ),
    );
  }

  _readingLevel(TeacherAddChildController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Selecione o nível de leitura:")
          .textColor(AppColors.secondary300)
          .fontSize(20),
       
        CheckboxListTile(
          contentPadding: EdgeInsets.symmetric(),
          activeColor: AppColors.primary,
          title: Text("Não alfabetizado/a/e")
          .textColor(AppColors.OnSurface)
          .fontSize(14),
          controlAffinity: ListTileControlAffinity.trailing,
          value: controller.readingLevel0, 
          onChanged: (value) => controller.readingLevel0 = value
        ),

        CheckboxListTile(
          contentPadding: EdgeInsets.symmetric(),
          activeColor: AppColors.primary,
          title: Text("Alfabetizado/a/e, mas precisa de ajudar para ler")
          .textColor(AppColors.OnSurface)
          .fontSize(14),
          controlAffinity: ListTileControlAffinity.trailing,
          value: controller.readingLevel1, 
          onChanged: (value) => controller.readingLevel1 = value
        ),

        CheckboxListTile(
          contentPadding: EdgeInsets.symmetric(),
          activeColor: AppColors.primary,
          title: Text("Alfabetizado/a/e, realiza a leitura sozinho/a/e")
          .textColor(AppColors.OnSurface)
          .fontSize(14),
          controlAffinity: ListTileControlAffinity.trailing,
          value: controller.readingLevel2, 
          onChanged: (value) => controller.readingLevel2 = value
        ),

        CheckboxListTile(
          contentPadding: EdgeInsets.symmetric(),
          activeColor: AppColors.primary,
          title: Text("Alfabetizado/a/e, com alto grau de assimilação")
          .textColor(AppColors.OnSurface)
          .fontSize(14),
          controlAffinity: ListTileControlAffinity.trailing,
          value: controller.readingLevel3, 
          onChanged: (value) => controller.readingLevel3 = value
        ),
      ]
    );
  }

  _supportWidget(TeacherAddChildController controller) {
    // TeacherAddChildController controller = Get.find<TeacherAddChildController>();
    return Column(
      children: [
        CheckboxListTile(
          contentPadding: EdgeInsets.symmetric(),
          activeColor: AppColors.primary900,
          title: Text("Solicitar apoio")
          .textColor(AppColors.primary900)
          .fontSize(20),
          controlAffinity: ListTileControlAffinity.trailing,
          value: controller.needsSupport, 
          onChanged: (value) => controller.needsSupport = value
        ),
        controller.needsSupport 
        ? 
        Column(
          children: [
            _supportValue(),
            _supportPIX(),
            _supportContact(),
            _supportInfo()
          ],
        ) 
        :
        SizedBox()
      ],
    );
  }

  _supportValue() {
    return TextField(
      style: TextStyle(
        fontSize: 16,
        height: 1.0,
      ),
      decoration: InputDecoration(
        labelText: "Valor",
        helperText: "Digite o valor de apoio para o livro e envio",
        helperStyle: TextStyle(
          color: Colors.black38,
          fontSize: 12,
          height: 0.8
        ),
        border: OutlineInputBorder()
      ),
    );
  }

  _supportPIX() {
    return TextField(
      style: TextStyle(
        fontSize: 16,
        height: 1.0,
      ),
      decoration: InputDecoration(
        labelText: "Chave Pix",
        helperText: "Digite a chave PIX para onde o apoio será enviado",
        helperStyle: TextStyle(
          color: Colors.black38,
          fontSize: 12,
          height: 0.8
        ),
        border: OutlineInputBorder()
      ),
    );
  }

  _supportContact() {
    return TextField(
      style: TextStyle(
        fontSize: 16,
        height: 1.0,
      ),
      decoration: InputDecoration(
        labelText: "Informações de contato",
        helperText: "Digite o contato para envio do comprovante PIX",
        helperStyle: TextStyle(
          color: Colors.black38,
          fontSize: 12,
          height: 0.8
        ),
        border: OutlineInputBorder()
      ),
    );
  }

  _supportInfo() {
    return TextField(
      textAlignVertical: TextAlignVertical.top,
      minLines: 4,
      maxLines: null,
      style: TextStyle(
        fontSize: 16,
        height: 1.0,
      ),
      decoration: InputDecoration(
        labelText: "Informações sobre o livro",
        helperText: "Digite aqui informações sobre o livro que será enviado",
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