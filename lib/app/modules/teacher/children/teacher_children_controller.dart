import 'package:gauge_iot/app/data/model/Child.dart';
import 'package:gauge_iot/app/data/model/User.dart';
import 'package:gauge_iot/app/data/model/shared_preferences_manager.dart';
import 'package:gauge_iot/app/data/provider/ChildProvider.dart';
import 'package:get/get.dart';

class TeacherChildrenController extends GetxController {
  final _isLoading = false.obs;
  get isLoading => this._isLoading.value;
  set isLoading(value) => this._isLoading.value = value;

  RxList<CriancaElement> children = <CriancaElement>[].obs;

  init() {
    load();
  }

  Future<void> load() async {
    isLoading = true;
    print("isLoading");
    Usuario? user = await SharedPreferencesManager.getUser();
    var childResponse = await ChildProvider().getChildren(user?.id ?? "");
    print("user id: ${user?.id}");
    print("response children: $childResponse");
    children.value = childResponse?.criancas ?? [];
    isLoading = false;
  }
}