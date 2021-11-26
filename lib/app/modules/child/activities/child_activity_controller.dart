import 'package:gauge_iot/app/data/model/Activity.dart';
import 'package:gauge_iot/app/data/model/User.dart';
import 'package:gauge_iot/app/data/model/SharedPreferencesManager.dart';
import 'package:gauge_iot/app/data/provider/TeacherProvider.dart';
import 'package:get/get.dart';

class ChildActivityController extends GetxController {
  final _isLoading = false.obs;
  get isLoading => this._isLoading.value;
  set isLoading(value) => this._isLoading.value = value;

  RxList<Activity> activities = <Activity>[].obs;

  init() {
    load();
  }

  Future<void> load() async {
    isLoading = true;
    Usuario? user = await SharedPreferencesManager.getUser();
    String? teacherId = await SharedPreferencesManager.getChildTeacherId();
    print("User id: ${user?.id}");
    print("Teacher id: $teacherId");
    var activitiesResponse = await TeacherProvider().getActivities(teacherId ?? "");

    List<Activity>? userActivities = activitiesResponse?.atividades.where((i) => i.criancas.contains(user?.id ?? "")).toList();

    activities.value = userActivities ?? [];
    isLoading = false;
  }
}