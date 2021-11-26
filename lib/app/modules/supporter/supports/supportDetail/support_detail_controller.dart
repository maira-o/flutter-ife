import 'package:gauge_iot/app/data/model/Support/Support.dart';
import 'package:gauge_iot/app/data/model/UserFull.dart';
import 'package:gauge_iot/app/utils/date_parser.dart';
import 'package:get/get.dart';

class SupportDetailController extends GetxController {
  String supportDate = "";
  String childName = "";
  String childCity = "";
  String supportInfo = "";
  double supportValue = 0;
  String supportPix = "";
  String supportPhone = "";

  @override
  void onInit() {
    if (Get.arguments != null) {
      var data = Get.arguments;
      Support support = data[0];
      UserFull child = data[1];
      print(Get.arguments);

      this.supportDate = DateParser.convertToDate(support.createAt.toString());
      this.childName = child.usuario.nome;
      this.childCity = child.usuario.crianca.cidade;
      this.supportInfo = support.livro;
      this.supportValue = support.valor;
      this.supportPix = support.pix;
      this.supportPhone = support.telefone;
    }
    super.onInit();
  }
}