// To parse this JSON data, do
//
//     final activityBody = activityBodyFromJson(jsonString);

import 'dart:convert';

class ActivityBody {
  String titulo;
  String descricao;
  List<String> criancas;

  ActivityBody({
        required this.titulo,
        required this.descricao,
        required this.criancas,
  });

  factory ActivityBody.fromRawJson(String str) => ActivityBody.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ActivityBody.fromJson(Map<String, dynamic> json) => ActivityBody(
      titulo: json["titulo"],
      descricao: json["descricao"],
      criancas: List<String>.from(json["criancas"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
      "titulo": titulo,
      "descricao": descricao,
      "criancas": List<dynamic>.from(criancas.map((x) => x)),
  };
}
