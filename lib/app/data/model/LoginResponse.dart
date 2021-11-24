// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';
import 'package:gauge_iot/app/data/model/User.dart';

class LoginResponse {
    LoginResponse({
        required this.status,
        required this.message,
        required this.token,
        required this.usuario,
    });

    int status;
    String message;
    String token;
    Usuario usuario;

    factory LoginResponse.fromRawJson(String str) => LoginResponse.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        status: json["status"],
        message: json["message"],
        token: json["token"],
        usuario: Usuario.fromJson(json["usuario"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "token": token,
        "usuario": usuario.toJson(),
    };
}