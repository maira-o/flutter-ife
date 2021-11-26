import 'package:gauge_iot/app/data/model/Child.dart';
import 'package:gauge_iot/app/data/model/Support/Support.dart';
import 'package:gauge_iot/app/data/model/Support/SupportBody.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import '../endpoints_constants.dart';
import 'GenericProvider.dart';

class ChildProvider {
    Future<ChildResponse?> getChildren(String userId) async {
    http.Response response = await GenericProvider.getRequest(EndPointConstants.getChildrenByEducator(userId));

    print("getChildren statuscode: ${response.statusCode}");

    // Handle response parsing
    if (response.statusCode == 200) {
      // Usar um desses dois
      return ChildResponse.fromRawJson(response.body);
      // return ChildResponse.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }

  Future<bool> addSupport(SupportBody supportBody) async {
    // Build JSON body
    Map data = supportBody.toJson();

    // Call post function and wait for response
    http.Response response = await GenericProvider.postRequest(EndPointConstants.includeSupport, data);

    // Handle response parsing
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<SupportResponse?> getSupports() async {
    http.Response response = await GenericProvider.getRequest(EndPointConstants.getSupports);

    // Handle response parsing
    if (response.statusCode == 200) {
      // Usar um desses dois
      return SupportResponse.fromRawJson(response.body);
      // return SupportResponse.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }

    Future<bool> deleteSupport(String supportId) async {
    http.Response response = await GenericProvider.deleteRequest(EndPointConstants.deleteSupport(supportId));

    // Handle response parsing
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}