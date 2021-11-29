import 'package:flutter/material.dart';
import 'package:gauge_iot/app/modules/landing/landing_controller.dart';
import 'package:gauge_iot/app/routes/app_pages.dart';
import 'package:gauge_iot/app/utils/constants.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

class LandingPage extends GetView<LandingController> {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: GetX<LandingController>(
          builder: (_) {
              return _.isLoading
                  ? Center(child: CircularProgressIndicator())
                  : _body(context);
          },
        )
      ),
    );
  }

  _body(BuildContext context) {
    return Column(
      children: [
        _form(context),
        SizedBox(height: 16),
        _button(),
        SizedBox(height: 16),
      ],
    ).padding(vertical: 30, horizontal: 16);
  }

  _form(BuildContext context) {
    return Expanded(
      child: Container(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: _formFields(context)
          )
        ),
      ),
    );
  }

  _formFields(BuildContext context) {
    return Column(
      children: [
        _ifeTitleRow(),
        SizedBox(height: 8),
        _ifeSubtitle(),
        SizedBox(height: MediaQuery.of(context).size.height * 0.075),
        _goToApoiadorFlow(),
        SizedBox(height: 16),
        _orLoginLabel(),
        SizedBox(height: 16),
        _emailTextField(),
        SizedBox(height: 16),
        _passwordTextField(),
      ]
    );
  }

  _ifeTitle() {
    return Text("Ife")
        .textColor(AppColors.primary900)
        .fontSize(96)
        .height(114);
  }

  _ifeTitleRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _ifeTitle(),
        SizedBox(
          width: 57,
          height: 57,
          child: Image.asset(Assets.book_heart)
        )
      ]
      );
  }

  _ifeSubtitle() {
    return Text("Um aplicativo de apoio à leitura infantil inclusiva")
        .textAlignment(TextAlign.center)
        .textColor(AppColors.secondary400)
        .fontSize(20);
  }
  
  _goToApoiadorFlow() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: AppColors.secondary100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        )
      ),
      onPressed: () {
        Get.offAllNamed(Routes.SUPPORTER_TAB);
      },
      child: Text("acesse a área do apoiador".toUpperCase())
              .textColor(AppColors.secondary900)
              .padding(vertical: 10)
    )
    .width(double.infinity);
  }

  _orLoginLabel() {
    return Text("ou faça login:")
        .textAlignment(TextAlign.center)
        .textColor(AppColors.secondary400)
        .fontSize(20);
  }

  _emailTextField() {
    return TextField(
      onChanged: (text) => controller.email = text,
      style: TextStyle(
        fontSize: 16,
        height: 1.0,
      ),
      decoration: InputDecoration(
        labelText: "Endereço de e-mail",
        helperText: "Digite seu e-mail",
        helperStyle: TextStyle(
          color: Colors.black38,
          fontSize: 12,
          height: 0.8
        ),
        border: OutlineInputBorder()
      ),
    );
  }

  _passwordTextField() {
    return TextField(
      onChanged: (text) => controller.password = text,
      obscureText: true,
      style: TextStyle(
        fontSize: 16,
        height: 1.0,
      ),
      decoration: InputDecoration(
        labelText: "Senha",
        helperText: "Digite sua senha",
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
      onPressed: () => controller.isFormValid ? controller.login((papel) { 
        if (papel == 1) {
          Get.offAllNamed(Routes.TEACHER_TAB);
        } else if (papel == 2) {
          Get.offAllNamed(Routes.CHILD_TAB);
        }
      }) : null, 
      style: ElevatedButton.styleFrom(
        primary: controller.isFormValid ? AppColors.primary : AppColors.primary50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        )
      ),
      child: Text("entrar".toUpperCase())
              .textColor(Colors.white)
              .letterSpacing(1.25)
    )
    .width(double.infinity)
    .height(48);
  }
}
