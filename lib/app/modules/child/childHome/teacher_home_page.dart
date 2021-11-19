import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gauge_iot/app/utils/constants.dart';
import 'package:styled_widget/styled_widget.dart';


class ChildHomePage extends StatelessWidget {
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
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 33),
            _richText(context),
            _childIcon(),
          ]
        )
        // .center()
      )
    ).padding(top: 16, left: 16, right: 16);
  }

  _richText(BuildContext context) {
    return RichText(
      textAlign: TextAlign.left,
      text: TextSpan(children: <TextSpan>[
        TextSpan(
            text: "Lendo eu me conheço e aprendo ",
            style: TextStyle(color: AppColors.primary900, fontSize: 34)),
        TextSpan(
            text: "sobre a nossa história!",
            style: TextStyle( color: AppColors.secondary, fontSize: 34)),
      ]),
    );
  }

  _childIcon() {
    return Image.asset(Assets.home_crianca);
    // return SizedBox(
    //   width: 156,
    //   height: 190,
    //   child: Image.asset(Assets.home_educador),
    // );
  }
}