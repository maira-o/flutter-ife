import 'package:gauge_iot/app/data/model/Activity.dart';
import 'package:gauge_iot/app/data/model/User.dart';
import 'package:gauge_iot/app/data/model/SharedPreferencesManager.dart';
import 'package:gauge_iot/app/data/provider/TeacherProvider.dart';
import 'package:get/get.dart';

class TeacherActivityController extends GetxController {
  final _isLoading = false.obs;
  get isLoading => this._isLoading.value;
  set isLoading(value) => this._isLoading.value = value;

  RxList<Activity> activities = <Activity>[].obs;

  Activity? selectedActivity = null;

  init() {
    load();
  }

  Future<void> load() async {
    isLoading = true;
    Usuario? user = await SharedPreferencesManager.getUser();
    var activitiesResponse = await TeacherProvider().getActivities(user?.id ?? "");
    activities.value = activitiesResponse?.atividades ?? [];
    isLoading = false;
  }

  Future<bool> deleteActyivity(int index) async {
    String activityId = activities[index].id;

    var deleteSupportResponse = await TeacherProvider().deleteActivity(activityId);

    print(deleteSupportResponse);

    if (deleteSupportResponse) {
      activities.removeAt(index);
    }

    return deleteSupportResponse;
  }
}