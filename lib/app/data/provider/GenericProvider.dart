import 'dart:convert';
import 'package:gauge_iot/app/data/model/shared_preferences_manager.dart';
import 'package:gauge_iot/app/data/provider/Storage.dart';
import 'package:gauge_iot/app/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class GenericProvider {
  /// Function that sends a CRUD GET request.
  /// Given a URL.
  static Future<http.Response> getRequest(String url) async {
    var response = await http.get(Uri.parse(url), headers: {
      "token": '${await SensitiveStorage().readValue(StorageValues.loginToken)}',
      "userid": '${await SharedPreferencesManager.getUserId()}'
    });

    return response;
  }

  /// Function that sends a CRUD POST request.
  /// Given a URL and a JSON format for body call.
  // static Future<http.Response> postRequest(String url, Map data) async {
  //   var response = await http.post(Uri.parse(url), body: json.encode(data));
    
  //   return response;
  // }

  static Future<http.Response> postRequest(String url, Map data) async {
    String token = await SensitiveStorage().readValue(StorageValues.loginToken);
    String userid = await SharedPreferencesManager.getUserId() ?? "";

    var response = http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "token": token,
        "userid": userid
      },
      body: jsonEncode(data)
    );

    return response;
  }


  /// Function that sends a CRUD POST request.
  /// Given a URL and a JSON format for body call.
  static Future<http.Response> deleteRequest(String url) async {
    var response = await http.delete(Uri.parse(url), headers: {
        "token": '${await SensitiveStorage().readValue(StorageValues.loginToken)}',
        "userid": '${await SharedPreferencesManager.getUserId()}'
    });
    
    return response;
  }
}
