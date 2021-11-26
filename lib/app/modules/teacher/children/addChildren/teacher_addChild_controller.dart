import 'package:gauge_iot/app/data/model/Child.dart';
import 'package:gauge_iot/app/data/model/ChildUserBody.dart';
import 'package:gauge_iot/app/data/model/User.dart';
import 'package:gauge_iot/app/data/model/shared_preferences_manager.dart';
import 'package:gauge_iot/app/data/provider/ChildProvider.dart';
import 'package:gauge_iot/app/data/provider/UserProvider.dart';
import 'package:gauge_iot/app/modules/teacher/children/teacher_children_controller.dart';
import 'package:get/get.dart';

class TeacherAddChildController extends GetxController {
  final _readingLevel0 = false.obs;
  get readingLevel0 => this._readingLevel0.value;
  set readingLevel0(index) {
    this._readingLevel0.value = index;
    nivelLeitura = 1;
  } 

  final _readingLevel1 = false.obs;
  get readingLevel1 => this._readingLevel1.value;
  set readingLevel1(index) {
    this._readingLevel1.value = index;
    nivelLeitura = 2;
  } 

  final _readingLevel2 = false.obs;
  get readingLevel2 => this._readingLevel2.value;
  set readingLevel2(index) {
    this._readingLevel2.value = index;
    nivelLeitura = 3;
  } 

  final _readingLevel3 = false.obs;
  get readingLevel3 => this._readingLevel3.value;
  set readingLevel3(index) {
    this._readingLevel3.value = index;
    nivelLeitura = 4;
  } 

  final _needsSupport = false.obs;
  get needsSupport => this._needsSupport.value;
  set needsSupport(index) => this._needsSupport.value = index;

  final _isFormValid = false.obs;
  get isFormValid => this._isFormValid.value;
  set isFormValid(value) => this._isFormValid.value = value;

  // Child body variables
  String nome = "";
  String email = "";
  String senha = "";
  String confirmaSenha = "";
  int papel = 2;
  String dtNasc = "";
  int anoEscolar = 0;
  String cidade = "";
  String uf = "RS";
  String telefone= "";
  String observacoes = "";
  int nivelLeitura = 0;

  validateForm() {
    if (email == "" || senha == "") {
      isFormValid = false;
    } else {
      isFormValid = true;
    }
  }

  unselectAllReadingLevel() {
    readingLevel0 = false;
    readingLevel1 = false;
    readingLevel2 = false;
    readingLevel3 = false;
  }

  addChildUser(Function(bool) closure) async {
    ChildUserBody childUser = ChildUserBody(
      nome: this.nome, 
      email: this.email, 
      senha: this.senha, 
      confirmaSenha: this.confirmaSenha, 
      papel: this.papel, 
      dtNasc: this.dtNasc, 
      anoEscolar: this.anoEscolar,
      cidade: this.cidade, 
      uf: this.uf, 
      telefone: this.telefone, 
      observacoes: this.observacoes, 
      nivelLeitura: this.nivelLeitura
    );

    print("User json: ${childUser.toRawJson()}");

    bool postChildUser = await UserProvider().addChildUser(childUser);
    
    print("deu certo o post? $postChildUser");
    
    TeacherChildrenController teacherChildrenController = Get.find<TeacherChildrenController>();
    teacherChildrenController.load();
    closure(postChildUser);
  }
}