import 'package:gauge_iot/app/data/model/Support/Support.dart';
import 'package:gauge_iot/app/data/model/UserFull.dart';
import 'package:gauge_iot/app/data/provider/ChildProvider.dart';
import 'package:gauge_iot/app/data/provider/UserProvider.dart';
import 'package:get/get.dart';

class SupportController extends GetxController {
  final _isLoading = false.obs;
  get isLoading => this._isLoading.value;
  set isLoading(value) => this._isLoading.value = value;

  RxList<Support> supports = <Support>[].obs;
  RxList<UserFull> children = <UserFull>[].obs;

  init() {
    load();
  }

  Future<void> load() async {
    isLoading = true;
    var supportResponse = await ChildProvider().getSupports();
    supports.value = supportResponse?.apoios ?? [];
    loadChildren();
  }

  Future<void> loadChildren() async {
    List<UserFull> childrenAux = [];
    for (var support in supports) {
      UserFull? userFull = await UserProvider().getUserFull(support.crianca, support.crianca);

      if (userFull != null) {
        childrenAux.add(userFull);
      }
    }
    children.value = childrenAux;
    isLoading = false;
  }
}