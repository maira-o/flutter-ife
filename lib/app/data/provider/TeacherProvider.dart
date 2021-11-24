import 'package:gauge_iot/app/data/model/Activity.dart';
import 'package:gauge_iot/app/data/model/ActivityBody.dart';
import 'package:gauge_iot/app/data/provider/GenericProvider.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import '../endpoints_constants.dart';

class TeacherProvider {
  Future<ActivityResponse?> getActivities(String userId) async {
    http.Response response = await GenericProvider.getRequest(EndPointConstants.getActivities(userId));

    // Handle response parsing
    if (response.statusCode == 200) {
      // Usar um desses dois
      return ActivityResponse.fromRawJson(response.body);
    } else {
      return null;
    }
  }

  Future<bool> addActivity(ActivityBody activityBody) async {
    // Build JSON body
    Map data = activityBody.toJson();

    // Call post function and wait for response
    http.Response response = await GenericProvider.postRequest(EndPointConstants.createActivity, data);

    // Handle response parsing
    if (response.statusCode == 200) {
      return true;
    } else {
      print("addActivity statuscode: ${response.statusCode}");
      return false;
    }
  }

  Future<bool> editActivity(ActivityBody activityBody, String activityId) async {
    // Build JSON body
    Map data = activityBody.toJson();

    // Call post function and wait for response
    http.Response response = await GenericProvider.postRequest(EndPointConstants.editActivity(activityId), data);

    // Handle response parsing
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }


  Future<bool> deleteActivity(String activityId) async {
    http.Response response = await GenericProvider.deleteRequest(EndPointConstants.deleteActivity(activityId));

    // Handle response parsing
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}