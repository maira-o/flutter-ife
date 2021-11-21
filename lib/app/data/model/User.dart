class TeacherUser {
    String nome;
    String email;
    String senha;
    String confirmaSenha;
    int papel;

    TeacherUser(this.nome, this.email, this.senha, this.confirmaSenha, this.papel);
}

class ChildUser {
    String nome;
    String email;
    String senha;
    String confirmaSenha;
    int papel;
    String dt_nasc;
    String ano_escolar;
    String cidade;
    String uf;
    String telefone;
    String observacoes;
    int nivel_leitura;

    ChildUser(
      this.nome, 
      this.email, 
      this.senha, 
      this.confirmaSenha, 
      this.papel,
      this.dt_nasc,
      this.ano_escolar,
      this.cidade,
      this.uf,
      this.telefone,
      this.observacoes,
      this.nivel_leitura
    );
}