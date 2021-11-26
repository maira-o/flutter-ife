import 'dart:convert';

class Usuario {
    Usuario({
        required this.nome,
        required this.email,
        required this.papel,
        required this.createAt,
        required this.id,
    });

    String nome;
    String email;
    int papel;
    DateTime createAt;
    String id;

    factory Usuario.fromRawJson(String str) => Usuario.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        nome: json["nome"],
        email: json["email"],
        papel: json["papel"],
        createAt: DateTime.parse(json["createAt"]),
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "nome": nome,
        "email": email,
        "papel": papel,
        "createAt": createAt.toIso8601String(),
        "_id": id,
    };
}