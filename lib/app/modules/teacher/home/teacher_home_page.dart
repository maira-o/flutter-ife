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
            _teacherIcon()
          ]
        )
      )
    ).padding(top: 16, left: 16, right: 16);
  }

  _testeRichText(BuildContext context) {
    return RichText(
      textAlign: TextAlign.left,
      text: TextSpan(children: <TextSpan>[
        TextSpan(
            text: "Adicione ",
            style: TextStyle(color: AppColors.primary900, fontSize: 34)),
        TextSpan(
            text: "atividades ",
            style: TextStyle( color: AppColors.secondary, fontSize: 34)),
        TextSpan(
            text: "pedagógicas e dicas de ",
            style: TextStyle(color: AppColors.primary900, fontSize: 34)),
        TextSpan(
            text: "leitura ",
            style: TextStyle( color: AppColors.secondary, fontSize: 34)
        ),
        TextSpan(
            text: "para os pequenos!",
            style: TextStyle(color: AppColors.primary900, fontSize: 34)
        ),
      ]),
    );
  }

  _teacherIcon() {
    return Image.asset(Assets.home_educador);
    // return SizedBox(
    //   width: 156,
    //   height: 190,
    //   child: Image.asset(Assets.home_educador),
    // );
  }
}