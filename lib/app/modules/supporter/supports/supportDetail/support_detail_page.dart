import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gauge_iot/app/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'support_detail_controller.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:get/get.dart';

class SupportDetailPage extends GetView<SupportDetailController> {
  const SupportDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Apoio")
                .textColor(Colors.white),
        centerTitle: false,
        backgroundColor: AppColors.primary
      ),
      extendBody: true,
      body: Container(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: _body(context)
          )
        ),
      ),
    );
  }

  _body(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(controller.supportDate)
        .textColor(AppColors.primary900)
        .fontSize(16),
        Text(controller.childName)
        .textColor(AppColors.secondary300)
        .fontSize(24),
        Text(controller.childCity)
        .fontSize(16),
        SizedBox(height: 16),
        Text("Informações sobre o livro")
        .textColor(AppColors.primary500)
        .fontSize(16),
        Text(controller.supportInfo)
        .fontSize(16),
        SizedBox(height: 16),
        Text("Valor de apoio para o livro e envio")
        .textColor(AppColors.primary500)
        .fontSize(16),
        Text("R\$ ${controller.currency.format(controller.supportValue)}")
        .fontSize(16),
        SizedBox(height: 16),
        _firstSetpWidget(),
        _secondSetpWidget(),
        _thirdSetpWidget(),
      ],
    ).padding(vertical: 30, horizontal: 16);
  }

  _firstSetpWidget() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.secondary100,
        ),
        child: Text("1")
          .textColor(AppColors.secondary900)
          .fontSize(20)
          .center()
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("1º passo")
              .textColor(AppColors.primary500)
              .fontSize(16),
              Text("Copie a chave PIX:")
              .fontSize(16),
              SelectableText(
                controller.supportPix,
                style: TextStyle(
                  color: AppColors.secondary300,
                  fontSize: 16
                ),
              )
              // Text(controller.supportPix)
              // .textColor(AppColors.secondary300)
              // .fontSize(16),
            ],
          )
        )
      ],
    );
  }

  _secondSetpWidget() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.secondary100,
        ),
        child: Text("2")
          .textColor(AppColors.secondary900)
          .fontSize(20)
          .center()
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("2º passo")
              .textColor(AppColors.primary500)
              .fontSize(16),
              Text("Abra um aplicativo que você tenha o PIX habilitado e realiza a transação no valor de: ")
              .fontSize(16),
              Text("R\$ ${controller.currency.format(controller.supportValue)}")
              .textColor(AppColors.secondary300)
              .fontSize(16),
            ],
          )
        )
      ],
    );
  }

  _thirdSetpWidget() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.secondary100,
        ),
        child: Text("3")
          .textColor(AppColors.secondary900)
          .fontSize(20)
          .center()
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("3º passo")
              .textColor(AppColors.primary500)
              .fontSize(16),
              Text("Envie o comprovante da transação PIX para o número: ")
              .fontSize(16),
              SelectableText(
                controller.supportPhone,
                style: TextStyle(
                  color: AppColors.secondary300,
                  fontSize: 16
                ),
              ),
              Text("Copie e cole a seguinte mensagem:")
              .fontSize(16),
              SizedBox(height: 10),
              SelectableText(
                "Estou enviando, o valor de R\$ ${controller.currency.format(controller.supportValue)} para apoio e envio do livro para ${controller.childName}.",
                style: TextStyle(
                  color: AppColors.primary900,
                  fontSize: 16
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}