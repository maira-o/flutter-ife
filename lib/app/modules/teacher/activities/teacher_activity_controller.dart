import 'package:gauge_iot/app/data/model/Activity.dart';
import 'package:gauge_iot/app/data/model/User.dart';
import 'package:gauge_iot/app/data/model/shared_preferences_manager.dart';
import 'package:gauge_iot/app/data/provider/TeacherProvider.dart';
import 'package:get/get.dart';

class TeacherActivityController extends GetxController {
  final _isLoading = false.obs;
  get isLoading => this._isLoading.value;
  set isLoading(value) => this._isLoading.value = value;

  RxList<Activity> activities = <Activity>[].obs;

  init() {
    load();
  }

  Future<void> load() async {
    isLoading = true;
    print("isLoading");
    Usuario? user = await SharedPreferencesManager.getUser();
    var activitiesResponse = await TeacherProvider().getActivities(user?.id ?? "");
    print("user id: ${user?.id}");
    print("response activity: $activitiesResponse");
    activities.value = activitiesResponse?.atividades ?? [];
    isLoading = false;
  }
}