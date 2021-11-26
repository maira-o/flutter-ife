import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gauge_iot/app/utils/constants.dart';
import 'package:styled_widget/styled_widget.dart';


class SupporterHomePage extends StatelessWidget {
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
            SizedBox(height: 33),
            _richText(context),
            _childIcon(),
          ]
        )
      )
    ).padding(top: 16, left: 16, right: 16);
  }

  _richText(BuildContext context) {
    return RichText(
      textAlign: TextAlign.left,
      text: TextSpan(children: <TextSpan>[
        TextSpan(
            text: "Apoie!",
            style: TextStyle( color: AppColors.secondary, fontSize: 34)),
        TextSpan(
            text: "Faça com que livros de ",
            style: TextStyle(color: AppColors.primary900, fontSize: 34)),
        TextSpan(
            text: "diversidade e inclusão ",
            style: TextStyle( color: AppColors.secondary, fontSize: 34)),
        TextSpan(
            text: "cheguem em mais crianças ",
            style: TextStyle(color: AppColors.primary900, fontSize: 34)),
      ]),
    );
  }

  _childIcon() {
    return Image.asset(Assets.home_apoiador);
  }
}