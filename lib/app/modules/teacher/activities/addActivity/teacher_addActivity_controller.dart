import 'package:gauge_iot/app/data/model/ActivityBody.dart';
import 'package:gauge_iot/app/data/model/Child.dart';
import 'package:gauge_iot/app/data/model/User.dart';
import 'package:gauge_iot/app/data/model/shared_preferences_manager.dart';
import 'package:gauge_iot/app/data/provider/ChildProvider.dart';
import 'package:gauge_iot/app/data/provider/TeacherProvider.dart';
import 'package:get/get.dart';

class SelectableChild {
  RxBool isSelected;
  final String name;
  final String id;

  SelectableChild(this.isSelected, this.name, this.id);
}

class TeacherAddActivityController extends GetxController {
  RxList<SelectableChild> selectableChild = <SelectableChild>[].obs;
  List<CriancaElement> children = [];
  String activityTitle = "";
  String activityDescription = "";

  final _isLoading = false.obs;
  get isLoading => this._isLoading.value;
  set isLoading(value) => this._isLoading.value = value;

  final _isFormValid = false.obs;
  get isFormValid => this._isFormValid.value;
  set isFormValid(value) => this._isFormValid.value = value;

  validateForm() {
    if (activityTitle != "" && activityDescription != "") {
      isFormValid = true;
    } else {
      isFormValid = false;
    }
  }

  init() {
    load();
  }

  Future<void> load() async {
    isLoading = true;

    Usuario? user = await SharedPreferencesManager.getUser();
    var childResponse = await ChildProvider().getChildren(user?.id ?? "");
    children = childResponse?.criancas ?? [];
    
    isLoading = false;

    RxList<SelectableChild> auxList = <SelectableChild>[].obs;
    for (var child in children) {
      SelectableChild auxChild = SelectableChild(false.obs, child.nome, child.id);
      auxList.add(auxChild);
    }
    selectableChild.value = auxList;
  }

  selectChild(int index, bool value) {
    selectableChild[index].isSelected.value = value;
  }

  addChild(Function(bool) closure) async {
    List<String> childrenIds = selectableChild.map((element) => element.id).toList();

    ActivityBody activityBody = ActivityBody(
      titulo: activityTitle, 
      descricao: activityDescription, 
      criancas: ["618b1d97685157f438f4a198", "618fe2c4291905ff68e07bfc"]
    );

    bool postActivity = await TeacherProvider().addActivity(activityBody);

    print("deu certo o post? $postActivity");
    closure(postActivity);

    return postActivity;
  }
}