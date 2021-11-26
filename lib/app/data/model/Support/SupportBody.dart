// To parse this JSON data, do
//
//     final supportBody = supportBodyFromJson(jsonString);

import 'dart:convert';

class SupportBody {
    SupportBody({
        required this.valor,
        required this.pix,
        required this.telefone,
        required this.livro,
        required this.criancaUsrId,
    });

    double valor;
    String pix;
    String telefone;
    String livro;
    String criancaUsrId;

    factory SupportBody.fromRawJson(String str) => SupportBody.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SupportBody.fromJson(Map<String, dynamic> json) => SupportBody(
        valor: json["valor"].toDouble(),
        pix: json["pix"],
        telefone: json["telefone"],
        livro: json["livro"],
        criancaUsrId: json["criancaUsrId"],
    );

    Map<String, dynamic> toJson() => {
        "valor": valor,
        "pix": pix,
        "telefone": telefone,
        "livro": livro,
        "criancaUsrId": criancaUsrId,
    };
}
