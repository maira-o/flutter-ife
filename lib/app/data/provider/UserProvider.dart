import 'package:gauge_iot/app/data/model/ChildUserBody.dart';
import 'package:gauge_iot/app/data/model/UserFull.dart';
import 'package:gauge_iot/app/data/provider/GenericProvider.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class UserProvider {
  Future<bool> addChildUser(ChildUserBody childBody) async {
    // Build JSON body
    Map data = childBody.toJson();
    
    http.Response response = await GenericProvider.postRequest("https://app-ife-gateway.herokuapp.com/usuario", data);

    print("add childUser statuscode: ${response.statusCode}");

    // Handle response parsing
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<UserFull?> getUserFull(String userId) async {
    http.Response response = await GenericProvider.getRequest("https://app-ife-gateway.herokuapp.com/usuario/$userId");

    print("get user full statusCode: ${response.statusCode}");

    if (response.statusCode == 200) {
      return UserFull.fromRawJson(response.body);
    } else {
      return null;
    }
  }
}