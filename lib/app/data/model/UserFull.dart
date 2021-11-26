// To parse this JSON data, do
//
//     final userFull = userFullFromJson(jsonString);

import 'dart:convert';

class UserFull {
    UserFull({
        required this.status,
        required this.message,
        required this.usuario,
    });

    int status;
    String message;
    ChildUserFull usuario;

    factory UserFull.fromRawJson(String str) => UserFull.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UserFull.fromJson(Map<String, dynamic> json) => UserFull(
        status: json["status"],
        message: json["message"],
        usuario: ChildUserFull.fromJson(json["usuario"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "usuario": usuario.toJson(),
    };
}

class ChildUserFull {
    ChildUserFull({
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
    CriancaFull crianca;

    factory ChildUserFull.fromRawJson(String str) => ChildUserFull.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ChildUserFull.fromJson(Map<String, dynamic> json) => ChildUserFull(
        nome: json["nome"],
        email: json["email"],
        papel: json["papel"],
        createAt: DateTime.parse(json["createAt"]),
        id: json["_id"],
        crianca: CriancaFull.fromJson(json["crianca"]),
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

class CriancaFull {
    CriancaFull({
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

    factory CriancaFull.fromRawJson(String str) => CriancaFull.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CriancaFull.fromJson(Map<String, dynamic> json) => CriancaFull(
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
