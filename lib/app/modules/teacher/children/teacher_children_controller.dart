import 'package:gauge_iot/app/data/model/Child.dart';
import 'package:gauge_iot/app/data/model/User.dart';
import 'package:gauge_iot/app/data/model/SharedPreferencesManager.dart';
import 'package:gauge_iot/app/data/provider/ChildProvider.dart';
import 'package:get/get.dart';

class TeacherChildrenController extends GetxController {
  final _isLoading = false.obs;
  get isLoading => this._isLoading.value;
  set isLoading(value) => this._isLoading.value = value;

  RxList<CriancaElement> children = <CriancaElement>[].obs;

  CriancaElement? selectedChild = null;

  init() {
    load();
  }

  Future<void> load() async {
    isLoading = true;
    Usuario? user = await SharedPreferencesManager.getUser();
    var childResponse = await ChildProvider().getChildren(user?.id ?? "");
    children.value = childResponse?.criancas ?? [];
    isLoading = false;
  }
}