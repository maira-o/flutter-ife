// To parse this JSON data, do
//
//     final childUserBody = childUserBodyFromJson(jsonString);

import 'dart:convert';

class ChildUserBody {
    ChildUserBody({
        required this.nome,
        required this.email,
        required this.senha,
        required this.confirmaSenha,
        required this.papel,
        required this.dtNasc,
        required this.anoEscolar,
        required this.cidade,
        required this.uf,
        required this.telefone,
        required this.observacoes,
        required this.nivelLeitura,
    });

    String nome;
    String email;
    String senha;
    String confirmaSenha;
    int papel;
    String dtNasc;
    int anoEscolar;
    String cidade;
    String uf;
    String telefone;
    String observacoes;
    int nivelLeitura;

    factory ChildUserBody.fromRawJson(String str) => ChildUserBody.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ChildUserBody.fromJson(Map<String, dynamic> json) => ChildUserBody(
        nome: json["nome"],
        email: json["email"],
        senha: json["senha"],
        confirmaSenha: json["confirmaSenha"],
        papel: json["papel"],
        dtNasc: json["dt_nasc"],
        anoEscolar: json["ano_escolar"],
        cidade: json["cidade"],
        uf: json["uf"],
        telefone: json["telefone"],
        observacoes: json["observacoes"],
        nivelLeitura: json["nivel_leitura"],
    );

    Map<String, dynamic> toJson() => {
        "nome": nome,
        "email": email,
        "senha": senha,
        "confirmaSenha": confirmaSenha,
        "papel": papel,
        "dt_nasc": dtNasc,
        "ano_escolar": anoEscolar,
        "cidade": cidade,
        "uf": uf,
        "telefone": telefone,
        "observacoes": observacoes,
        "nivel_leitura": nivelLeitura,
    };
}
