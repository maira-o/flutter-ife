import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gauge_iot/app/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'teacher_addChild_controller.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:get/get.dart';

class TeacherAddChildPage extends GetView<TeacherAddChildController> {
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
              return _.isLoading
              ? Center(child: CircularProgressIndicator())
              : _body(context);
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
        if (controller.isEditing) 
          Text("Edição de criança não disponivel nesta versão")
          .fontSize(12),
          SizedBox(height: 12),
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
        _nameTextField(),
        SizedBox(height: 16),
        _emailTextField(),
        SizedBox(height: 16),
        _passwordTextField(),
        SizedBox(height: 16),
        _confirmPasswordTextField(),
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
        _readingLevel(),
        SizedBox(height: 16),
        _supportWidget(),
      ]
    );
  }

  _nameTextField() {
    return TextField(
      enabled: !controller.isEditing,
      controller: TextEditingController(text: controller.nome),
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
      onChanged: (text) {
        controller.nome = text;
        controller.validateForm();
      },
    );
  }

  _emailTextField() {
    return TextField(
      enabled: !controller.isEditing,
      controller: TextEditingController(text: controller.email),
      style: TextStyle(
        fontSize: 16,
        height: 1.0,
      ),
      decoration: InputDecoration(
        labelText: "Email",
        helperText: "Digite o email para a conta da criança",
        helperStyle: TextStyle(
          color: Colors.black38,
          fontSize: 12,
          height: 0.8
        ),
        border: OutlineInputBorder()
      ),
      onChanged: (text) {
        controller.email = text;
        controller.validateForm();
      },
    );
  }

  _passwordTextField() {
    return TextField(
      enabled: !controller.isEditing,
      controller: TextEditingController(text: controller.senha),
      obscureText: true,
      style: TextStyle(
        fontSize: 16,
        height: 1.0,
      ),
      decoration: InputDecoration(
        labelText: "Senha",
        helperText: "Digite a senha para a conta da criança",
        helperStyle: TextStyle(
          color: Colors.black38,
          fontSize: 12,
          height: 0.8
        ),
        border: OutlineInputBorder()
      ),
      onChanged: (text) {
        controller.senha = text;
        controller.validateForm();
      },
    );
  }

  _confirmPasswordTextField() {
    return TextField(
      enabled: !controller.isEditing,
      controller: TextEditingController(text: controller.confirmaSenha),
      obscureText: true,
      style: TextStyle(
        fontSize: 16,
        height: 1.0,
      ),
      decoration: InputDecoration(
        labelText: "Confirma senha",
        helperText: "Digite a senha para a conta da criança",
        helperStyle: TextStyle(
          color: Colors.black38,
          fontSize: 12,
          height: 0.8
        ),
        border: OutlineInputBorder()
      ),
      onChanged: (text) {
        controller.confirmaSenha = text;
        controller.validateForm();
      },
    );
  }

    _ageTextField() {
    return TextField(
      enabled: !controller.isEditing,
      controller: TextEditingController(text: controller.dtNasc),
      keyboardType: TextInputType.datetime,
      inputFormatters: [controller.childDateMask],
      style: TextStyle(
        fontSize: 16,
        height: 1.0,
      ),
      decoration: InputDecoration(
        labelText: "Data de nascimento",
        helperText: "Digite a data de nascimento da criança",
        helperStyle: TextStyle(
          color: Colors.black38,
          fontSize: 12,
          height: 0.8
        ),
        border: OutlineInputBorder()
      ),
      onChanged: (text) {
        controller.dtNasc = controller.childDateMask.getMaskedText();
        controller.validateForm();
      },
    );
  }

    _schoolYearTextField() {
    return TextField(
      enabled: !controller.isEditing,
      controller: TextEditingController(text: controller.anoEscolar == 0 ? "" : "${controller.anoEscolar}"),
      keyboardType: TextInputType.number,
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
      onChanged: (text) {
        if (text == "") {
          // do nothing
        } else {
          controller.anoEscolar = int.parse(text);
          controller.validateForm(); 
        }
      },
    );
  }

    _cityTextField() {
    return TextField(
      enabled: !controller.isEditing,
      controller: TextEditingController(text: controller.cidade),
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
      onChanged: (text) {
        controller.cidade = text;
        controller.validateForm();
      },
    );
  }

   _contactTextField() {
    return TextField(
      enabled: !controller.isEditing,
      controller: TextEditingController(text: controller.telefone),
      keyboardType: TextInputType.number,
      inputFormatters: [controller.childTelefoneMask],
      style: TextStyle(
        fontSize: 16,
        height: 1.0,
      ),
      decoration: InputDecoration(
        labelText: "Telefone",
        helperText: "Digite as informações de contato",
        helperStyle: TextStyle(
          color: Colors.black38,
          fontSize: 12,
          height: 0.8
        ),
        border: OutlineInputBorder()
      ),
      onChanged: (text) {
        controller.telefone = controller.childTelefoneMask.getMaskedText();
        controller.validateForm();
      },
    );
  }

  _obsTextField() {
    return TextField(
      enabled: !controller.isEditing,
      controller: TextEditingController(text: controller.observacoes),
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
      onChanged: (text) {
        controller.observacoes = text;
        controller.validateForm();
      },
    );
  }

  _readingLevel() {
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
          onChanged: (value) {
            if (controller.isEditing) {
              null;
            } else {
              controller.unselectAllReadingLevel();
              controller.readingLevel0 = value;
            }
          }
        ),

        CheckboxListTile(
          contentPadding: EdgeInsets.symmetric(),
          activeColor: AppColors.primary,
          title: Text("Alfabetizado/a/e, mas precisa de ajudar para ler")
          .textColor(AppColors.OnSurface)
          .fontSize(14),
          controlAffinity: ListTileControlAffinity.trailing,
          value: controller.readingLevel1, 
          onChanged: (value) {
            if (controller.isEditing) {
              null;
            } else {
              controller.unselectAllReadingLevel();
              controller.readingLevel1 = value;
            }
          } 
        ),

        CheckboxListTile(
          contentPadding: EdgeInsets.symmetric(),
          activeColor: AppColors.primary,
          title: Text("Alfabetizado/a/e, realiza a leitura sozinho/a/e")
          .textColor(AppColors.OnSurface)
          .fontSize(14),
          controlAffinity: ListTileControlAffinity.trailing,
          value: controller.readingLevel2, 
          onChanged: (value) {
          if (controller.isEditing) {
              null;
            } else {
              controller.unselectAllReadingLevel();
              controller.readingLevel2 = value;
            }
          } 
        ),

        CheckboxListTile(
          contentPadding: EdgeInsets.symmetric(),
          activeColor: AppColors.primary,
          title: Text("Alfabetizado/a/e, com alto grau de assimilação")
          .textColor(AppColors.OnSurface)
          .fontSize(14),
          controlAffinity: ListTileControlAffinity.trailing,
          value: controller.readingLevel3, 
          onChanged: (value) {
            if (controller.isEditing) {
              null;
            } else {
              controller.unselectAllReadingLevel();
              controller.readingLevel3 = value;
            }
          } 
        ),
      ]
    );
  }

  _supportWidget() {
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
          onChanged: (value) {
            if (controller.isEditing) {
              null;
            } else {
              controller.needsSupport = value;
            }
          } 
        ),
        controller.needsSupport 
        ? 
        Column(
          children: [
            _supportValue(),
            SizedBox(height: 16),
            _supportPIX(),
            SizedBox(height: 16),
            _supportContact(),
            SizedBox(height: 16),
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
      onChanged: (text) {
        if (text == "") {
          // do nothing
        } else {
          controller.valor = double.parse(text);
          controller.validateForm(); 
        }
      },
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
      onChanged: (text) {
        controller.pix = text;
        controller.validateForm(); 
      },
    );
  }

  _supportContact() {
    return TextField(
      keyboardType: TextInputType.number,
      inputFormatters: [controller.supportTelefoneMask],
      style: TextStyle(
        fontSize: 16,
        height: 1.0,
      ),
      decoration: InputDecoration(
        labelText: "Telefone",
        helperText: "Digite o telefone para envio do comprovante PIX",
        helperStyle: TextStyle(
          color: Colors.black38,
          fontSize: 12,
          height: 0.8
        ),
        border: OutlineInputBorder()
      ),
      onChanged: (text) {
        controller.supportTelefone = controller.supportTelefoneMask.getMaskedText();
        controller.validateForm(); 
      },
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
      onChanged: (text) {
        controller.livro = text;
        controller.validateForm(); 
      },
    );
  }

  _button(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (controller.isEditing) {
          null;
        } else {
          controller.addChildUser((success) => {
            if (success) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  elevation: 6.0,
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.green,
                  content: Text("Criança adicionada com sucesso")
                            .fontSize(18)
                            .fontWeight(FontWeight.bold)
                )
              ),
              Get.back()
            } else {
              Get.back(),
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  elevation: 6.0,
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.red,
                  content: Text("Ocorreu Algum erro ao adicionar a criança")
                            .fontSize(18)
                            .fontWeight(FontWeight.bold)
                )
              )
            }
          });
        }
      }, 
      style: ElevatedButton.styleFrom(
        primary: !controller.isEditing ? AppColors.primary : AppColors.primary50,
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