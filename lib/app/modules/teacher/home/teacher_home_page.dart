import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gauge_iot/app/utils/constants.dart';
import 'package:styled_widget/styled_widget.dart';


class TeacherHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ife")
                .textColor(Colors.white),
        centerTitle: false,
        backgroundColor: AppColors.primary
      ),
      extendBody: true,
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Styled.widget(
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            _testeRichText(context),
            _teacherIcon(context)
          ]
        )
      )
    ).padding(top: 16, left: 16, right: 16);
  }

  Widget _testeRichText(BuildContext context) {
    return RichText(
      textAlign: TextAlign.left,
      text: TextSpan(children: <TextSpan>[
        TextSpan(
            text: "Solicite apoio ",
            style: TextStyle( color: AppColors.secondary, fontSize: 24)),
        TextSpan(  
            text: "para envio de livros às crianças que precisam e também adicione ",
            style: TextStyle(color: AppColors.primary900, fontSize: 24)),
        TextSpan(
            text: "atividades pedagógicas ",
            style: TextStyle( color: AppColors.secondary, fontSize: 24)),
        TextSpan(
            text: "para os pequenos visualizarem.",
            style: TextStyle(color: AppColors.primary900, fontSize: 24)),
      ]),
    );
  }

  _teacherIcon(BuildContext context) {
    return Image.asset(Assets.home_educador);
  }
}