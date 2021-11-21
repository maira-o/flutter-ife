  import 'dart:convert';
import 'package:gauge_iot/app/data/model/LoginResponse.dart';
import 'package:gauge_iot/app/data/provider/GenericProvider.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import '../endpoints_constants.dart';

class LoginProvider {
  Future<LoginResponse?> postLogin(String email, String password) async {
    // Build JSON body
    Map data = {
      'email': '$email', 
      'senha': '$password'
    };

    // Call post function and wait for response
    http.Response response = await GenericProvider.postRequest("https://app-ife-gateway.herokuapp.com/login", data);

    // Handle response parsing
    if (response.statusCode == 200 || response.statusCode == 201) {
      // Usar um desses dois
      // return LoginResponse.fromJson(jsonDecode(response.body));
      return LoginResponse.fromRawJson(response.body);
    } else {
      print(response.statusCode);
      return null;
    }
  }
}