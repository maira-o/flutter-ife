import 'package:gauge_iot/app/data/model/Activity.dart';
import 'package:gauge_iot/app/utils/date_parser.dart';
import 'package:get/get.dart';

class ChildActivityDetailController extends GetxController {
  String title = "";
  String date = "";
  String description = "";

  @override
  void onInit() {
    if (Get.arguments != null) {
      Activity activity = Get.arguments;
      this.title = activity.titulo;
      this.description = activity.descricao;
      this.date = DateParser.convertToDate(activity.createAt.toString());
    }
    super.onInit();
  }
}