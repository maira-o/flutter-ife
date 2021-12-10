import 'package:gauge_iot/app/data/model/Child.dart';
import 'package:gauge_iot/app/data/model/ChildUserBody.dart';
import 'package:gauge_iot/app/data/model/Support/SupportBody.dart';
import 'package:gauge_iot/app/data/model/UserFull.dart';
import 'package:gauge_iot/app/data/provider/ChildProvider.dart';
import 'package:gauge_iot/app/data/provider/UserProvider.dart';
import 'package:gauge_iot/app/modules/teacher/children/teacher_children_controller.dart';
import 'package:gauge_iot/app/utils/date_parser.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:get/get.dart';

class TeacherAddChildController extends GetxController {
  final _isLoading = false.obs;
  get isLoading => this._isLoading.value;
  set isLoading(value) => this._isLoading.value = value;

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

  // Support variables
  double valor = 0;
  String pix = "";
  String supportTelefone = "";
  String livro = "";

  var childTelefoneMask = new MaskTextInputFormatter(mask: '(##) #########', filter: { "#": RegExp(r'[0-9]') });
  var supportTelefoneMask = new MaskTextInputFormatter(mask: '(##) #########', filter: { "#": RegExp(r'[0-9]') });

  // Editing variables
  bool isEditing = false;

    @override
  void onInit() {
    TeacherChildrenController childController = Get.find<TeacherChildrenController>();

    if (childController.selectedChild != null) {
      CriancaElement editingChild = childController.selectedChild!;

      print("id da crianca: ${editingChild.id}");

      this.isEditing = true;
      this.nome = editingChild.nome;
      this.email = editingChild.email;
      this.senha = "senha";
      this.confirmaSenha = "senha";
      this.dtNasc = DateParser.convertToDate(editingChild.crianca.dtNasc.toString());
      this.anoEscolar = editingChild.crianca.anoEscolar;
      this.cidade = editingChild.crianca.cidade;
      this.uf = editingChild.crianca.uf;
      this.telefone = editingChild.crianca.telefone;
      this.observacoes = editingChild.crianca.observacoes;
      this.nivelLeitura = editingChild.crianca.nivelLeitura;

      switch (this.nivelLeitura) {
        case 0:
          readingLevel0 = true;
          break;

        case 1:
        readingLevel1 = true;
          break;
        
        case 2:
        readingLevel2 = true;
          break;

        case 3:
        readingLevel3 = true;
          break;
        default:
      }
    }
    super.onInit();
  }

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
    isLoading = true;

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

    UserFull? postChildUser = await UserProvider().addChildUser(childUser);
    
    if (postChildUser != null) {
      if (needsSupport) {
        await addSupport(postChildUser.usuario.crianca.usuario);
      } 

      TeacherChildrenController teacherChildrenController = Get.find<TeacherChildrenController>();
      teacherChildrenController.load();

      closure(true);
    } else {
      closure(false);
    }
    isLoading = false;
  }

  addSupport(String childId) async {
    SupportBody supportBody = SupportBody(
      valor: this.valor, 
      pix: this.pix, 
      telefone: this.supportTelefone, 
      livro: this.livro, 
      criancaUsrId: childId
    );

    print("support body json: ${supportBody.toRawJson()}");

    bool postSupport = await ChildProvider().addSupport(supportBody);

    print("deu certo o post de support? $postSupport");
  }
}