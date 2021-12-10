import 'package:gauge_iot/app/data/model/Activity.dart';
import 'package:gauge_iot/app/data/model/User.dart';
import 'package:gauge_iot/app/data/model/SharedPreferencesManager.dart';
import 'package:gauge_iot/app/data/provider/Storage.dart';
import 'package:gauge_iot/app/data/provider/TeacherProvider.dart';
import 'package:gauge_iot/app/utils/constants.dart';
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

    print("token ${await SensitiveStorage().readValue(StorageValues.loginToken)}");
    print("userid ${await SharedPreferencesManager.getUserId()}");

    isLoading = false;
  }

  Future<void> deleteActyivity(Activity activity, Function(bool) closure) async {
    print(activity);
    print(activity);
    String activityId = activity.id;

    int index = activities.indexOf(activity);

    var deleteActivityResponse = await TeacherProvider().deleteActivity(activityId);

    print(deleteActivityResponse);

    if (deleteActivityResponse) {
      activities.removeAt(index);
    }

    closure(deleteActivityResponse);
    load();
  }
}