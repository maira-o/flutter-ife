import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

class GenericProvider {
  /// Function that sends a CRUD GET request.
  /// Given a URL.
  static Future<http.Response> getRequest(String url) async {
    var response = await http.get(Uri.parse(url), headers: {
      // "Cookie": '${await TokenManager.getJwtToken()}',
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
    return http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data)
    );
  }


  /// Function that sends a CRUD POST request.
  /// Given a URL and a JSON format for body call.
  static Future<http.Response> deleteRequest(String url) async {
    var response = await http.delete(Uri.parse(url), headers: {

    });
    
    return response;
  }
}
