// To parse this JSON data, do
//
//     final supportResponse = supportResponseFromJson(jsonString);

import 'dart:convert';

class SupportResponse {
    SupportResponse({
        required this.status,
        required this.message,
        required this.apoios,
    });

    int status;
    String message;
    List<Support> apoios;

    factory SupportResponse.fromRawJson(String str) => SupportResponse.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SupportResponse.fromJson(Map<String, dynamic> json) => SupportResponse(
        status: json["status"],
        message: json["message"],
        apoios: List<Support>.from(json["apoios"].map((x) => Support.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "apoios": List<dynamic>.from(apoios.map((x) => x.toJson())),
    };
}

class Support {
    Support({
        required this.id,
        required this.valor,
        required this.pix,
        required this.telefone,
        required this.livro,
        required this.educador,
        required this.crianca,
        required this.isActive,
        required this.createAt,
        required this.v,
    });

    String id;
    double valor;
    String pix;
    String telefone;
    String livro;
    String educador;
    String crianca;
    bool isActive;
    DateTime createAt;
    int v;

    factory Support.fromRawJson(String str) => Support.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Support.fromJson(Map<String, dynamic> json) => Support(
        id: json["_id"],
        valor: json["valor"].toDouble(),
        pix: json["pix"],
        telefone: json["telefone"],
        livro: json["livro"],
        educador: json["educador"],
        crianca: json["crianca"],
        isActive: json["isActive"],
        createAt: DateTime.parse(json["createAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "valor": valor,
        "pix": pix,
        "telefone": telefone,
        "livro": livro,
        "educador": educador,
        "crianca": crianca,
        "isActive": isActive,
        "createAt": createAt.toIso8601String(),
        "__v": v,
    };
}
