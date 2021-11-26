import 'dart:convert';
import 'package:gauge_iot/app/data/model/ChildUserBody.dart';
import 'package:gauge_iot/app/data/model/shared_preferences_manager.dart';
import 'package:gauge_iot/app/data/provider/Storage.dart';
import 'package:gauge_iot/app/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class UserProvider {
  Future<bool> addChildUser(ChildUserBody childBody) async {
    // Build JSON body
    Map data = childBody.toJson();

    // Call post function and wait for response
    String token = await SensitiveStorage().readValue(StorageValues.loginToken);
    String userid = await SharedPreferencesManager.getUserId() ?? "";

    var response = await http.post(
      Uri.parse("https://app-ife-gateway.herokuapp.com/usuario"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "token": token,
        "userid": userid
      },
      body: jsonEncode(data)
    );
    // http.Response response = await GenericProvider.postRequest("https://app-ife-gateway.herokuapp.com/usuario", data);

    print("add childUser statuscode: ${response.statusCode}");

    // Handle response parsing
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}