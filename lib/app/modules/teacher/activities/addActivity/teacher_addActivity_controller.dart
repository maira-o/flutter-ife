import 'package:gauge_iot/app/data/model/Activity.dart';
import 'package:gauge_iot/app/data/model/ActivityBody.dart';
import 'package:gauge_iot/app/data/model/Child.dart';
import 'package:gauge_iot/app/data/model/User.dart';
import 'package:gauge_iot/app/data/model/SharedPreferencesManager.dart';
import 'package:gauge_iot/app/data/provider/ChildProvider.dart';
import 'package:gauge_iot/app/data/provider/TeacherProvider.dart';
import 'package:gauge_iot/app/modules/teacher/activities/teacher_activity_controller.dart';
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
  
  // Editing variables
  List<String> selectedChildrenIds = [];
  bool isEditing = false;
  String activityId = "";

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

  @override
  void onInit() {
    TeacherActivityController activityController = Get.find<TeacherActivityController>();

    if (activityController.selectedActivity != null) {
      Activity activity = activityController.selectedActivity!;
      this.isEditing = true;
      this.activityId = activity.id;
      this.activityTitle = activity.titulo;
      this.activityDescription = activity.descricao;
      this.selectedChildrenIds = activity.criancas;
      validateForm();
    }

    load();
    super.onInit();
  }

  Future<void> load() async {
    isLoading = true;

    Usuario? user = await SharedPreferencesManager.getUser();
    var childResponse = await ChildProvider().getChildren(user?.id ?? "");
    children = childResponse?.criancas ?? [];
    
    isLoading = false;

    RxList<SelectableChild> auxList = <SelectableChild>[].obs;
    for (var child in children) {
      bool isSelected = selectedChildrenIds.contains(child.id);
      SelectableChild auxChild = SelectableChild(isSelected.obs, child.nome, child.id);
      auxList.add(auxChild);
    }
    selectableChild.value = auxList;
  }

  selectChild(int index, bool value) {
    selectableChild[index].isSelected.value = value;
  }

  addActivity(Function(bool, bool) closure) async {
    isLoading = true;
    List<SelectableChild> selectableChildSelected = selectableChild.where((element) => element.isSelected.value).toList();
    List<String> childrenIds = selectableChildSelected.map((element) => element.id).toList();
    
    ActivityBody activityBody = ActivityBody(
      titulo: activityTitle, 
      descricao: activityDescription, 
      criancas: childrenIds
    );

    bool postActivity = false;

    if (isEditing) {
      postActivity = await TeacherProvider().editActivity(activityBody, this.activityId);
    } else {
      postActivity = await TeacherProvider().addActivity(activityBody);
    }

    print("deu certo o post/put? $postActivity");
    TeacherActivityController activityController = Get.find<TeacherActivityController>();
    activityController.load();
    closure(postActivity, isEditing);
    isLoading = false;
  }
}