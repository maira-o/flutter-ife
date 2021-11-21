// To parse this JSON data, do
//
//     final activityResponse = activityResponseFromJson(jsonString);

import 'dart:convert';

class ActivityResponse {
    ActivityResponse({
        required this.status,
        required this.message,
        required this.atividades,
    });

    int status;
    String message;
    List<Activity> atividades;

    factory ActivityResponse.fromRawJson(String str) => ActivityResponse.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ActivityResponse.fromJson(Map<String, dynamic> json) => ActivityResponse(
        status: json["status"],
        message: json["message"],
        atividades: List<Activity>.from(json["atividades"].map((x) => Activity.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "atividades": List<dynamic>.from(atividades.map((x) => x.toJson())),
    };
}

class Activity {
    Activity({
        required this.id,
        required this.titulo,
        required this.descricao,
        required this.educador,
        required this.isActive,
        required this.createAt,
        required this.v,
        required this.criancas,
    });

    String id;
    String titulo;
    String descricao;
    String educador;
    bool isActive;
    DateTime createAt;
    int v;
    List<String> criancas;

    factory Activity.fromRawJson(String str) => Activity.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Activity.fromJson(Map<String, dynamic> json) => Activity(
        id: json["_id"],
        titulo: json["titulo"],
        descricao: json["descricao"],
        educador: json["educador"],
        isActive: json["isActive"],
        createAt: DateTime.parse(json["createAt"]),
        v: json["__v"],
        criancas: List<String>.from(json["criancas"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "titulo": titulo,
        "descricao": descricao,
        "educador": educador,
        "isActive": isActive,
        "createAt": createAt.toIso8601String(),
        "__v": v,
        "criancas": List<dynamic>.from(criancas.map((x) => x)),
    };
}
