// To parse this JSON data, do
//
//     final childResponse = childResponseFromJson(jsonString);

import 'dart:convert';

class ChildResponse {
    ChildResponse({
        required this.status,
        required this.message,
        required this.criancas,
    });

    int status;
    String message;
    List<CriancaElement> criancas;

    factory ChildResponse.fromRawJson(String str) => ChildResponse.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ChildResponse.fromJson(Map<String, dynamic> json) => ChildResponse(
        status: json["status"],
        message: json["message"],
        criancas: List<CriancaElement>.from(json["criancas"].map((x) => CriancaElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "criancas": List<dynamic>.from(criancas.map((x) => x.toJson())),
    };
}

class CriancaElement {
    CriancaElement({
        required this.nome,
        required this.email,
        required this.papel,
        required this.createAt,
        required this.id,
        required this.crianca,
    });

    String nome;
    String email;
    int papel;
    DateTime createAt;
    String id;
    Child crianca;

    factory CriancaElement.fromRawJson(String str) => CriancaElement.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CriancaElement.fromJson(Map<String, dynamic> json) => CriancaElement(
        nome: json["nome"],
        email: json["email"],
        papel: json["papel"],
        createAt: DateTime.parse(json["createAt"]),
        id: json["_id"],
        crianca: Child.fromJson(json["crianca"]),
    );

    Map<String, dynamic> toJson() => {
        "nome": nome,
        "email": email,
        "papel": papel,
        "createAt": createAt.toIso8601String(),
        "_id": id,
        "crianca": crianca.toJson(),
    };
}

class Child {
    Child({
        required this.id,
        required this.dtNasc,
        required this.anoEscolar,
        required this.cidade,
        required this.uf,
        required this.telefone,
        required this.observacoes,
        required this.nivelLeitura,
        required this.usuario,
        required this.educador,
        required this.isActive,
        required this.createAt,
        required this.v,
    });

    String id;
    DateTime dtNasc;
    int anoEscolar;
    String cidade;
    String uf;
    String telefone;
    String observacoes;
    int nivelLeitura;
    String usuario;
    String educador;
    bool isActive;
    DateTime createAt;
    int v;

    factory Child.fromRawJson(String str) => Child.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Child.fromJson(Map<String, dynamic> json) => Child(
        id: json["_id"],
        dtNasc: DateTime.parse(json["dt_nasc"]),
        anoEscolar: json["ano_escolar"],
        cidade: json["cidade"],
        uf: json["uf"],
        telefone: json["telefone"],
        observacoes: json["observacoes"],
        nivelLeitura: json["nivel_leitura"],
        usuario: json["usuario"],
        educador: json["educador"],
        isActive: json["isActive"],
        createAt: DateTime.parse(json["createAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "dt_nasc": dtNasc.toIso8601String(),
        "ano_escolar": anoEscolar,
        "cidade": cidade,
        "uf": uf,
        "telefone": telefone,
        "observacoes": observacoes,
        "nivel_leitura": nivelLeitura,
        "usuario": usuario,
        "educador": educador,
        "isActive": isActive,
        "createAt": createAt.toIso8601String(),
        "__v": v,
    };
}
